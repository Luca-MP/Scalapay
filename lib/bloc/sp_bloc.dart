import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:scalapay/data/productService.dart';
import 'package:scalapay/shared_widgets/constants.dart';
import 'package:scalapay/shared_widgets/sp_order_bottom_sheet.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'sp_bloc.freezed.dart';
part 'sp_event.dart';
part 'sp_state.dart';

@injectable
class SpBloc extends Bloc<SpEvent, SpState> {
  final ProductService _productService;

  SpBloc(this._productService) : super(const SpState.searching()) {
    on<SpEvent>(
      (event, emit) async {
        await event.when(
          search: (searchText, minPrice, maxPrice, orderType, pageSize, pageKey, pagingController,) async {
            _fetchPage(searchText, minPrice, maxPrice, convertOrderType(orderType), pageSize, pageKey, pagingController);
          },
          openLink: (url) async {
            if (!await launchUrl(Uri.parse(url))) {
              throw Exception('Could not launch $url');
            }
          },
        );
      },
    );
  }

  Future<void> _fetchPage(
    String searchText,
    double minPrice,
    double maxPrice,
    String sortBy,
    int pageSize,
    int pageKey,
    PagingController pagingController,
  ) async {
    try {
      final products = await _productService.getProducts(
        query: searchText,
        per_page: pageSize,
        page: pageKey,
        filter_by: "",
        sort_by: sortBy,
        minPrice: minPrice,
        maxPrice: maxPrice,
        partnerId: SPConstants.partnerId,
        source: SPConstants.source,
        language: SPConstants.language,
        country: SPConstants.language.toUpperCase(),
      );
      // this check prevents multi-refresh errors
      if (pageKey == 1) {
        if (pagingController.itemList != null) {
          pagingController.itemList!.clear();
        }
      }
      final isLastPage = products.length < pageSize;
      // this check prevents multi-refresh errors
      if ((pageKey == 1 && pagingController.itemList == null) ||
          (pageKey > 1 && pagingController.itemList != null)) {
        if (isLastPage) {
          pagingController.appendLastPage(products);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(products, nextPageKey);
        }
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  String convertOrderType(OrderType orderType) {
    String sorting;
    switch (orderType) {
      case OrderType.asc:
        sorting = "selling_price:asc";
        break;
      case OrderType.desc:
        sorting = "selling_price:desc";
      case OrderType.az:
        sorting = "_text_match:asc";
      case OrderType.za:
        sorting = "_text_match:asc";
    }
    return sorting;
  }
}

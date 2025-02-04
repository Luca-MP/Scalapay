import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:scalapay/data/models/sp_grouped_hits/sp_grouped_hits.dart';
import 'package:scalapay/data/productService.dart';
import 'package:scalapay/main.dart';
import 'package:scalapay/shared_widgets/sp_order_bottom_sheet.dart';
import 'package:injectable/injectable.dart';

part 'sp_bloc.freezed.dart';
part 'sp_event.dart';
part 'sp_state.dart';

@injectable
class SpBloc extends Bloc<SpEvent, SpState> {
  final ProductService _productService;

  SpBloc(this._productService) : super(const SpState.initial()) {
    on<SpEvent>(
      (event, emit) async {
        await event.when(
          search: (searchText, pageSize, pageKey, pagingController) async {
            emit(const SpState.loading());
            _fetchPage(searchText, pageSize, pageKey, pagingController);
            emit (SpState.loaded([]));
          },
          filter: (min, max) async {
            print("Price filter: form $min to $max");
          },
          orderBy: (orderType) async {
            print("Order by: $orderType");
          },
        );
      },
    );
  }

  Future<void> _fetchPage(
      String searchText,
      int pageSize,
      int pageKey,
      PagingController pagingController,
      ) async {
    try {
      final products = await getIt<ProductService>().getProducts(
        query: searchText,
        per_page: pageSize,
        page: pageKey,
        filter_by: "",
        sort_by: "selling_price%3Aasc",
        minPrice: 13.0,
        maxPrice: 278.0,
        partnerId: "scalapayappit",
        source: "trovaprezzi",
        language: "it",
        country: "IT",
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
}

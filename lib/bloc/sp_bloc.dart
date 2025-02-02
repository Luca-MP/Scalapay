import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scalapay/data/models/sp_product/sp_product.dart';
import 'package:scalapay/data/productService.dart';
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
          search: (searchText) async {
            /*_productService.getProducts(
              searchText ?? "",
              30,
              1,
              "",
              "selling_price%3Aasc",
              13.0,
              278.0,
              "scalapayappit",
              "trovaprezzi",
              "it",
              "IT",
            );*/
            print("Item searched: $searchText");
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
}

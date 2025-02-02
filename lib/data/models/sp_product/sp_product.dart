import 'package:freezed_annotation/freezed_annotation.dart';

part 'sp_product.freezed.dart';
part 'sp_product.g.dart';

@freezed
class SPProduct with _$SPProduct {
  factory SPProduct({
    required String name,
    required int price,
  }) = _SPProduct;
  factory SPProduct.fromJson(Map<String, dynamic> json) =>
      _$SPProductFromJson(json);
}

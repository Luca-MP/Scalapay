import 'package:freezed_annotation/freezed_annotation.dart';

part 'sp_product.freezed.dart';
part 'sp_product.g.dart';

@freezed
class SPDocument with _$SPDocument {
  factory SPDocument({
    required String? affiliate_url,
    required String? brand,
    required String? brandId,
    required String? category,
    required String? category_1,
    required String? category_2,
    required String? description,
    required int? discount_percentage,
    required int? has_image,
    required String? id,
    required String? image,
    required String? image_merchant,
    required double? list_price,
    required String? merchant,
    required String? merchantId,
    required bool? new_offer,
    required double? selling_price,
    required List<String>? tags,
    required String? title,
    required String? url,
    required bool? isMerchantCard,
    required String? merchantToken
  }) = _SPDocument;

  factory SPDocument.fromJson(Map<String, dynamic> json) =>
      _$SPDocumentFromJson(json);
}

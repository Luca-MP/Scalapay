// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SPDocumentImpl _$$SPDocumentImplFromJson(Map<String, dynamic> json) =>
    _$SPDocumentImpl(
      affiliate_url: json['affiliate_url'] as String?,
      brand: json['brand'] as String?,
      brandId: json['brandId'] as String?,
      category: json['category'] as String?,
      category_1: json['category_1'] as String?,
      category_2: json['category_2'] as String?,
      description: json['description'] as String?,
      discount_percentage: json['discount_percentage'] as int?,
      has_image: json['has_image'] as int?,
      id: json['id'] as String?,
      image: json['image'] as String?,
      image_merchant: json['image_merchant'] as String?,
      list_price: (json['list_price'] as num?)?.toDouble(),
      merchant: json['merchant'] as String?,
      merchantId: json['merchantId'] as String?,
      new_offer: json['new_offer'] as bool?,
      selling_price: (json['selling_price'] as num?)?.toDouble(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      title: json['title'] as String?,
      url: json['url'] as String?,
      isMerchantCard: json['isMerchantCard'] as bool?,
      merchantToken: json['merchantToken'] as String?,
    );

Map<String, dynamic> _$$SPDocumentImplToJson(_$SPDocumentImpl instance) =>
    <String, dynamic>{
      'affiliate_url': instance.affiliate_url,
      'brand': instance.brand,
      'brandId': instance.brandId,
      'category': instance.category,
      'category_1': instance.category_1,
      'category_2': instance.category_2,
      'description': instance.description,
      'discount_percentage': instance.discount_percentage,
      'has_image': instance.has_image,
      'id': instance.id,
      'image': instance.image,
      'image_merchant': instance.image_merchant,
      'list_price': instance.list_price,
      'merchant': instance.merchant,
      'merchantId': instance.merchantId,
      'new_offer': instance.new_offer,
      'selling_price': instance.selling_price,
      'tags': instance.tags,
      'title': instance.title,
      'url': instance.url,
      'isMerchantCard': instance.isMerchantCard,
      'merchantToken': instance.merchantToken,
    };

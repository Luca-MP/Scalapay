import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scalapay/data/models/sp_product/sp_product.dart';

part 'sp_hits.freezed.dart';
part 'sp_hits.g.dart';

@freezed
class SPHits with _$SPHits {
  factory SPHits({
    required SPDocument document,
  }) = _SPHits;

  factory SPHits.fromJson(Map<String, dynamic> json) =>
      _$SPHitsFromJson(json);
}

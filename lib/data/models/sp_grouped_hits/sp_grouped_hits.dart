import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scalapay/data/models/hits/sp_hits.dart';

part 'sp_grouped_hits.freezed.dart';
part 'sp_grouped_hits.g.dart';

@freezed
class SPGroupedHits with _$SPGroupedHits {
  factory SPGroupedHits({
    required List<SPHits> hits ,
  }) = _SPGroupedHits;

  factory SPGroupedHits.fromJson(Map<String, dynamic> json) =>
      _$SPGroupedHitsFromJson(json);
}

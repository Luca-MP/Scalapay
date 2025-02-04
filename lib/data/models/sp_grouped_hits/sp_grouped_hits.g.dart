// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_grouped_hits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SPGroupedHitsImpl _$$SPGroupedHitsImplFromJson(Map<String, dynamic> json) =>
    _$SPGroupedHitsImpl(
      hits: (json['hits'] as List<dynamic>)
          .map((e) => SPHits.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SPGroupedHitsImplToJson(_$SPGroupedHitsImpl instance) =>
    <String, dynamic>{
      'hits': instance.hits,
    };

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sp_grouped_hits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SPGroupedHits _$SPGroupedHitsFromJson(Map<String, dynamic> json) {
  return _SPGroupedHits.fromJson(json);
}

/// @nodoc
mixin _$SPGroupedHits {
  List<SPHits> get hits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SPGroupedHitsCopyWith<SPGroupedHits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SPGroupedHitsCopyWith<$Res> {
  factory $SPGroupedHitsCopyWith(
          SPGroupedHits value, $Res Function(SPGroupedHits) then) =
      _$SPGroupedHitsCopyWithImpl<$Res, SPGroupedHits>;
  @useResult
  $Res call({List<SPHits> hits});
}

/// @nodoc
class _$SPGroupedHitsCopyWithImpl<$Res, $Val extends SPGroupedHits>
    implements $SPGroupedHitsCopyWith<$Res> {
  _$SPGroupedHitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hits = null,
  }) {
    return _then(_value.copyWith(
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<SPHits>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SPGroupedHitsImplCopyWith<$Res>
    implements $SPGroupedHitsCopyWith<$Res> {
  factory _$$SPGroupedHitsImplCopyWith(
          _$SPGroupedHitsImpl value, $Res Function(_$SPGroupedHitsImpl) then) =
      __$$SPGroupedHitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SPHits> hits});
}

/// @nodoc
class __$$SPGroupedHitsImplCopyWithImpl<$Res>
    extends _$SPGroupedHitsCopyWithImpl<$Res, _$SPGroupedHitsImpl>
    implements _$$SPGroupedHitsImplCopyWith<$Res> {
  __$$SPGroupedHitsImplCopyWithImpl(
      _$SPGroupedHitsImpl _value, $Res Function(_$SPGroupedHitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hits = null,
  }) {
    return _then(_$SPGroupedHitsImpl(
      hits: null == hits
          ? _value._hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<SPHits>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SPGroupedHitsImpl implements _SPGroupedHits {
  _$SPGroupedHitsImpl({required final List<SPHits> hits}) : _hits = hits;

  factory _$SPGroupedHitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SPGroupedHitsImplFromJson(json);

  final List<SPHits> _hits;
  @override
  List<SPHits> get hits {
    if (_hits is EqualUnmodifiableListView) return _hits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hits);
  }

  @override
  String toString() {
    return 'SPGroupedHits(hits: $hits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SPGroupedHitsImpl &&
            const DeepCollectionEquality().equals(other._hits, _hits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_hits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SPGroupedHitsImplCopyWith<_$SPGroupedHitsImpl> get copyWith =>
      __$$SPGroupedHitsImplCopyWithImpl<_$SPGroupedHitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SPGroupedHitsImplToJson(
      this,
    );
  }
}

abstract class _SPGroupedHits implements SPGroupedHits {
  factory _SPGroupedHits({required final List<SPHits> hits}) =
      _$SPGroupedHitsImpl;

  factory _SPGroupedHits.fromJson(Map<String, dynamic> json) =
      _$SPGroupedHitsImpl.fromJson;

  @override
  List<SPHits> get hits;
  @override
  @JsonKey(ignore: true)
  _$$SPGroupedHitsImplCopyWith<_$SPGroupedHitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

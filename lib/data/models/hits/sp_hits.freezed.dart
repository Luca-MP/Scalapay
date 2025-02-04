// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sp_hits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SPHits _$SPHitsFromJson(Map<String, dynamic> json) {
  return _SPHits.fromJson(json);
}

/// @nodoc
mixin _$SPHits {
  SPDocument get document => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SPHitsCopyWith<SPHits> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SPHitsCopyWith<$Res> {
  factory $SPHitsCopyWith(SPHits value, $Res Function(SPHits) then) =
      _$SPHitsCopyWithImpl<$Res, SPHits>;
  @useResult
  $Res call({SPDocument document});

  $SPDocumentCopyWith<$Res> get document;
}

/// @nodoc
class _$SPHitsCopyWithImpl<$Res, $Val extends SPHits>
    implements $SPHitsCopyWith<$Res> {
  _$SPHitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
  }) {
    return _then(_value.copyWith(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as SPDocument,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SPDocumentCopyWith<$Res> get document {
    return $SPDocumentCopyWith<$Res>(_value.document, (value) {
      return _then(_value.copyWith(document: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SPHitsImplCopyWith<$Res> implements $SPHitsCopyWith<$Res> {
  factory _$$SPHitsImplCopyWith(
          _$SPHitsImpl value, $Res Function(_$SPHitsImpl) then) =
      __$$SPHitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SPDocument document});

  @override
  $SPDocumentCopyWith<$Res> get document;
}

/// @nodoc
class __$$SPHitsImplCopyWithImpl<$Res>
    extends _$SPHitsCopyWithImpl<$Res, _$SPHitsImpl>
    implements _$$SPHitsImplCopyWith<$Res> {
  __$$SPHitsImplCopyWithImpl(
      _$SPHitsImpl _value, $Res Function(_$SPHitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
  }) {
    return _then(_$SPHitsImpl(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as SPDocument,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SPHitsImpl implements _SPHits {
  _$SPHitsImpl({required this.document});

  factory _$SPHitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SPHitsImplFromJson(json);

  @override
  final SPDocument document;

  @override
  String toString() {
    return 'SPHits(document: $document)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SPHitsImpl &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, document);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SPHitsImplCopyWith<_$SPHitsImpl> get copyWith =>
      __$$SPHitsImplCopyWithImpl<_$SPHitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SPHitsImplToJson(
      this,
    );
  }
}

abstract class _SPHits implements SPHits {
  factory _SPHits({required final SPDocument document}) = _$SPHitsImpl;

  factory _SPHits.fromJson(Map<String, dynamic> json) = _$SPHitsImpl.fromJson;

  @override
  SPDocument get document;
  @override
  @JsonKey(ignore: true)
  _$$SPHitsImplCopyWith<_$SPHitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

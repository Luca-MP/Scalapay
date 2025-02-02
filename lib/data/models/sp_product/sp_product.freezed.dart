// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sp_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SPProduct _$SPProductFromJson(Map<String, dynamic> json) {
  return _SPProduct.fromJson(json);
}

/// @nodoc
mixin _$SPProduct {
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SPProductCopyWith<SPProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SPProductCopyWith<$Res> {
  factory $SPProductCopyWith(SPProduct value, $Res Function(SPProduct) then) =
      _$SPProductCopyWithImpl<$Res, SPProduct>;
  @useResult
  $Res call({String name, int price});
}

/// @nodoc
class _$SPProductCopyWithImpl<$Res, $Val extends SPProduct>
    implements $SPProductCopyWith<$Res> {
  _$SPProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SPProductImplCopyWith<$Res>
    implements $SPProductCopyWith<$Res> {
  factory _$$SPProductImplCopyWith(
          _$SPProductImpl value, $Res Function(_$SPProductImpl) then) =
      __$$SPProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int price});
}

/// @nodoc
class __$$SPProductImplCopyWithImpl<$Res>
    extends _$SPProductCopyWithImpl<$Res, _$SPProductImpl>
    implements _$$SPProductImplCopyWith<$Res> {
  __$$SPProductImplCopyWithImpl(
      _$SPProductImpl _value, $Res Function(_$SPProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$SPProductImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SPProductImpl implements _SPProduct {
  _$SPProductImpl({required this.name, required this.price});

  factory _$SPProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$SPProductImplFromJson(json);

  @override
  final String name;
  @override
  final int price;

  @override
  String toString() {
    return 'SPProduct(name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SPProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SPProductImplCopyWith<_$SPProductImpl> get copyWith =>
      __$$SPProductImplCopyWithImpl<_$SPProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SPProductImplToJson(
      this,
    );
  }
}

abstract class _SPProduct implements SPProduct {
  factory _SPProduct({required final String name, required final int price}) =
      _$SPProductImpl;

  factory _SPProduct.fromJson(Map<String, dynamic> json) =
      _$SPProductImpl.fromJson;

  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$SPProductImplCopyWith<_$SPProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

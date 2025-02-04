// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)
        search,
    required TResult Function(int? min, int? max) filter,
    required TResult Function(OrderType? orderType) orderBy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult? Function(int? min, int? max)? filter,
    TResult? Function(OrderType? orderType)? orderBy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult Function(int? min, int? max)? filter,
    TResult Function(OrderType? orderType)? orderBy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Filter value) filter,
    required TResult Function(_OrderBy value) orderBy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_OrderBy value)? orderBy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Filter value)? filter,
    TResult Function(_OrderBy value)? orderBy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpEventCopyWith<$Res> {
  factory $SpEventCopyWith(SpEvent value, $Res Function(SpEvent) then) =
      _$SpEventCopyWithImpl<$Res, SpEvent>;
}

/// @nodoc
class _$SpEventCopyWithImpl<$Res, $Val extends SpEvent>
    implements $SpEventCopyWith<$Res> {
  _$SpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String searchText,
      int pageSize,
      int pageKey,
      PagingController<dynamic, dynamic> pagingController});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$SpEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? pageSize = null,
    Object? pageKey = null,
    Object? pagingController = null,
  }) {
    return _then(_$SearchImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageKey: null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as int,
      pagingController: null == pagingController
          ? _value.pagingController
          : pagingController // ignore: cast_nullable_to_non_nullable
              as PagingController<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(
      {required this.searchText,
      required this.pageSize,
      required this.pageKey,
      required this.pagingController});

  @override
  final String searchText;
  @override
  final int pageSize;
  @override
  final int pageKey;
  @override
  final PagingController<dynamic, dynamic> pagingController;

  @override
  String toString() {
    return 'SpEvent.search(searchText: $searchText, pageSize: $pageSize, pageKey: $pageKey, pagingController: $pagingController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey) &&
            (identical(other.pagingController, pagingController) ||
                other.pagingController == pagingController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, searchText, pageSize, pageKey, pagingController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)
        search,
    required TResult Function(int? min, int? max) filter,
    required TResult Function(OrderType? orderType) orderBy,
  }) {
    return search(searchText, pageSize, pageKey, pagingController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult? Function(int? min, int? max)? filter,
    TResult? Function(OrderType? orderType)? orderBy,
  }) {
    return search?.call(searchText, pageSize, pageKey, pagingController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult Function(int? min, int? max)? filter,
    TResult Function(OrderType? orderType)? orderBy,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchText, pageSize, pageKey, pagingController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Filter value) filter,
    required TResult Function(_OrderBy value) orderBy,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_OrderBy value)? orderBy,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Filter value)? filter,
    TResult Function(_OrderBy value)? orderBy,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SpEvent {
  const factory _Search(
          {required final String searchText,
          required final int pageSize,
          required final int pageKey,
          required final PagingController<dynamic, dynamic> pagingController}) =
      _$SearchImpl;

  String get searchText;
  int get pageSize;
  int get pageKey;
  PagingController<dynamic, dynamic> get pagingController;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterImplCopyWith<$Res> {
  factory _$$FilterImplCopyWith(
          _$FilterImpl value, $Res Function(_$FilterImpl) then) =
      __$$FilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? min, int? max});
}

/// @nodoc
class __$$FilterImplCopyWithImpl<$Res>
    extends _$SpEventCopyWithImpl<$Res, _$FilterImpl>
    implements _$$FilterImplCopyWith<$Res> {
  __$$FilterImplCopyWithImpl(
      _$FilterImpl _value, $Res Function(_$FilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_$FilterImpl(
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FilterImpl implements _Filter {
  const _$FilterImpl({required this.min, required this.max});

  @override
  final int? min;
  @override
  final int? max;

  @override
  String toString() {
    return 'SpEvent.filter(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      __$$FilterImplCopyWithImpl<_$FilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)
        search,
    required TResult Function(int? min, int? max) filter,
    required TResult Function(OrderType? orderType) orderBy,
  }) {
    return filter(min, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult? Function(int? min, int? max)? filter,
    TResult? Function(OrderType? orderType)? orderBy,
  }) {
    return filter?.call(min, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult Function(int? min, int? max)? filter,
    TResult Function(OrderType? orderType)? orderBy,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(min, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Filter value) filter,
    required TResult Function(_OrderBy value) orderBy,
  }) {
    return filter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_OrderBy value)? orderBy,
  }) {
    return filter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Filter value)? filter,
    TResult Function(_OrderBy value)? orderBy,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this);
    }
    return orElse();
  }
}

abstract class _Filter implements SpEvent {
  const factory _Filter({required final int? min, required final int? max}) =
      _$FilterImpl;

  int? get min;
  int? get max;
  @JsonKey(ignore: true)
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderByImplCopyWith<$Res> {
  factory _$$OrderByImplCopyWith(
          _$OrderByImpl value, $Res Function(_$OrderByImpl) then) =
      __$$OrderByImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderType? orderType});
}

/// @nodoc
class __$$OrderByImplCopyWithImpl<$Res>
    extends _$SpEventCopyWithImpl<$Res, _$OrderByImpl>
    implements _$$OrderByImplCopyWith<$Res> {
  __$$OrderByImplCopyWithImpl(
      _$OrderByImpl _value, $Res Function(_$OrderByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderType = freezed,
  }) {
    return _then(_$OrderByImpl(
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType?,
    ));
  }
}

/// @nodoc

class _$OrderByImpl implements _OrderBy {
  const _$OrderByImpl({required this.orderType});

  @override
  final OrderType? orderType;

  @override
  String toString() {
    return 'SpEvent.orderBy(orderType: $orderType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderByImpl &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderByImplCopyWith<_$OrderByImpl> get copyWith =>
      __$$OrderByImplCopyWithImpl<_$OrderByImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)
        search,
    required TResult Function(int? min, int? max) filter,
    required TResult Function(OrderType? orderType) orderBy,
  }) {
    return orderBy(orderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult? Function(int? min, int? max)? filter,
    TResult? Function(OrderType? orderType)? orderBy,
  }) {
    return orderBy?.call(orderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, int pageSize, int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult Function(int? min, int? max)? filter,
    TResult Function(OrderType? orderType)? orderBy,
    required TResult orElse(),
  }) {
    if (orderBy != null) {
      return orderBy(orderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Filter value) filter,
    required TResult Function(_OrderBy value) orderBy,
  }) {
    return orderBy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_OrderBy value)? orderBy,
  }) {
    return orderBy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Filter value)? filter,
    TResult Function(_OrderBy value)? orderBy,
    required TResult orElse(),
  }) {
    if (orderBy != null) {
      return orderBy(this);
    }
    return orElse();
  }
}

abstract class _OrderBy implements SpEvent {
  const factory _OrderBy({required final OrderType? orderType}) = _$OrderByImpl;

  OrderType? get orderType;
  @JsonKey(ignore: true)
  _$$OrderByImplCopyWith<_$OrderByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SPGroupedHits> products) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SPGroupedHits> products)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SPGroupedHits> products)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpStateCopyWith<$Res> {
  factory $SpStateCopyWith(SpState value, $Res Function(SpState) then) =
      _$SpStateCopyWithImpl<$Res, SpState>;
}

/// @nodoc
class _$SpStateCopyWithImpl<$Res, $Val extends SpState>
    implements $SpStateCopyWith<$Res> {
  _$SpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SpState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SPGroupedHits> products) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SPGroupedHits> products)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SPGroupedHits> products)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SpState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SpStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SpState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SPGroupedHits> products) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SPGroupedHits> products)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SPGroupedHits> products)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SpState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SPGroupedHits> products});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SpStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$LoadedImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<SPGroupedHits>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<SPGroupedHits> products) : _products = products;

  final List<SPGroupedHits> _products;
  @override
  List<SPGroupedHits> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'SpState.loaded(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SPGroupedHits> products) loaded,
    required TResult Function() error,
  }) {
    return loaded(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SPGroupedHits> products)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SPGroupedHits> products)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SpState {
  const factory _Loaded(final List<SPGroupedHits> products) = _$LoadedImpl;

  List<SPGroupedHits> get products;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SpStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'SpState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SPGroupedHits> products) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SPGroupedHits> products)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SPGroupedHits> products)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SpState {
  const factory _Error() = _$ErrorImpl;
}

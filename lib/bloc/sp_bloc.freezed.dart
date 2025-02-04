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
    required TResult Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)
        search,
    required TResult Function(String url) openLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult? Function(String url)? openLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult Function(String url)? openLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_OpenLink value) openLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_OpenLink value)? openLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_OpenLink value)? openLink,
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
      double minPrice,
      double maxPrice,
      OrderType orderType,
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
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? orderType = null,
    Object? pageSize = null,
    Object? pageKey = null,
    Object? pagingController = null,
  }) {
    return _then(_$SearchImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
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
      required this.minPrice,
      required this.maxPrice,
      required this.orderType,
      required this.pageSize,
      required this.pageKey,
      required this.pagingController});

  @override
  final String searchText;
  @override
  final double minPrice;
  @override
  final double maxPrice;
  @override
  final OrderType orderType;
  @override
  final int pageSize;
  @override
  final int pageKey;
  @override
  final PagingController<dynamic, dynamic> pagingController;

  @override
  String toString() {
    return 'SpEvent.search(searchText: $searchText, minPrice: $minPrice, maxPrice: $maxPrice, orderType: $orderType, pageSize: $pageSize, pageKey: $pageKey, pagingController: $pagingController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey) &&
            (identical(other.pagingController, pagingController) ||
                other.pagingController == pagingController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, minPrice, maxPrice,
      orderType, pageSize, pageKey, pagingController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)
        search,
    required TResult Function(String url) openLink,
  }) {
    return search(searchText, minPrice, maxPrice, orderType, pageSize, pageKey,
        pagingController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult? Function(String url)? openLink,
  }) {
    return search?.call(searchText, minPrice, maxPrice, orderType, pageSize,
        pageKey, pagingController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult Function(String url)? openLink,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchText, minPrice, maxPrice, orderType, pageSize,
          pageKey, pagingController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_OpenLink value) openLink,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_OpenLink value)? openLink,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_OpenLink value)? openLink,
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
          required final double minPrice,
          required final double maxPrice,
          required final OrderType orderType,
          required final int pageSize,
          required final int pageKey,
          required final PagingController<dynamic, dynamic> pagingController}) =
      _$SearchImpl;

  String get searchText;
  double get minPrice;
  double get maxPrice;
  OrderType get orderType;
  int get pageSize;
  int get pageKey;
  PagingController<dynamic, dynamic> get pagingController;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenLinkImplCopyWith<$Res> {
  factory _$$OpenLinkImplCopyWith(
          _$OpenLinkImpl value, $Res Function(_$OpenLinkImpl) then) =
      __$$OpenLinkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$OpenLinkImplCopyWithImpl<$Res>
    extends _$SpEventCopyWithImpl<$Res, _$OpenLinkImpl>
    implements _$$OpenLinkImplCopyWith<$Res> {
  __$$OpenLinkImplCopyWithImpl(
      _$OpenLinkImpl _value, $Res Function(_$OpenLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$OpenLinkImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OpenLinkImpl implements _OpenLink {
  const _$OpenLinkImpl({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'SpEvent.openLink(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenLinkImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenLinkImplCopyWith<_$OpenLinkImpl> get copyWith =>
      __$$OpenLinkImplCopyWithImpl<_$OpenLinkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)
        search,
    required TResult Function(String url) openLink,
  }) {
    return openLink(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult? Function(String url)? openLink,
  }) {
    return openLink?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String searchText,
            double minPrice,
            double maxPrice,
            OrderType orderType,
            int pageSize,
            int pageKey,
            PagingController<dynamic, dynamic> pagingController)?
        search,
    TResult Function(String url)? openLink,
    required TResult orElse(),
  }) {
    if (openLink != null) {
      return openLink(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_OpenLink value) openLink,
  }) {
    return openLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_OpenLink value)? openLink,
  }) {
    return openLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_OpenLink value)? openLink,
    required TResult orElse(),
  }) {
    if (openLink != null) {
      return openLink(this);
    }
    return orElse();
  }
}

abstract class _OpenLink implements SpEvent {
  const factory _OpenLink({required final String url}) = _$OpenLinkImpl;

  String get url;
  @JsonKey(ignore: true)
  _$$OpenLinkImplCopyWith<_$OpenLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() searching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? searching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? searching,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Searching value) searching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Searching value)? searching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Searching value)? searching,
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
abstract class _$$SearchingImplCopyWith<$Res> {
  factory _$$SearchingImplCopyWith(
          _$SearchingImpl value, $Res Function(_$SearchingImpl) then) =
      __$$SearchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchingImplCopyWithImpl<$Res>
    extends _$SpStateCopyWithImpl<$Res, _$SearchingImpl>
    implements _$$SearchingImplCopyWith<$Res> {
  __$$SearchingImplCopyWithImpl(
      _$SearchingImpl _value, $Res Function(_$SearchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchingImpl implements _Searching {
  const _$SearchingImpl();

  @override
  String toString() {
    return 'SpState.searching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() searching,
  }) {
    return searching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? searching,
  }) {
    return searching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? searching,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Searching value) searching,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Searching value)? searching,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Searching value)? searching,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class _Searching implements SpState {
  const factory _Searching() = _$SearchingImpl;
}

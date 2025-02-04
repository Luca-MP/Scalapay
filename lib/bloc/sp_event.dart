part of 'sp_bloc.dart';

@freezed
class SpEvent with _$SpEvent {
  const factory SpEvent.search({
    required String searchText,
    required double minPrice,
    required double maxPrice,
    required OrderType orderType,
    required int pageSize,
    required int pageKey,
    required PagingController pagingController,
  }) = _Search;

  const factory SpEvent.openLink({required String url}) = _OpenLink;
}

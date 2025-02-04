part of 'sp_bloc.dart';

@freezed
class SpEvent with _$SpEvent {
  const factory SpEvent.search({
    required String searchText,
    required int pageSize,
    required int pageKey,
    required PagingController pagingController,
  }) = _Search;

  const factory SpEvent.filter({
    required int? min,
    required int? max,
  }) = _Filter;

  const factory SpEvent.orderBy({required OrderType? orderType}) = _OrderBy;
}

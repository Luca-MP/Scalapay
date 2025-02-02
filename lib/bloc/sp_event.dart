part of 'sp_bloc.dart';

@freezed
class SpEvent with _$SpEvent {
  const factory SpEvent.search({required String? searchText}) = _Search;

  const factory SpEvent.filter({
    required int? min,
    required int? max,
  }) = _Filter;

  const factory SpEvent.orderBy({required OrderType? orderType}) = _OrderBy;
}

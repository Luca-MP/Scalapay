part of 'sp_bloc.dart';

@freezed
class SpEvent with _$SpEvent {
  const factory SpEvent.search({required String? searchText}) = _Search;
}

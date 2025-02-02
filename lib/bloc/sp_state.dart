part of 'sp_bloc.dart';

@freezed
class SpState with _$SpState {
  const factory SpState.initial() = _Initial;
  const factory SpState.loading() = _Loading;
  const factory SpState.loaded(List<SPProduct> products) = _Loaded;
  const factory SpState.error() = _Error;
}

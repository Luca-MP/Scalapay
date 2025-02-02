import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sp_bloc.freezed.dart';
part 'sp_event.dart';
part 'sp_state.dart';

class SpBloc extends Bloc<SpEvent, SpState> {

  SpBloc() : super(const SpState.initial()) {
    on<SpEvent>(
      (event, emit) async {
        await event.when(
          search: (searchText) async {
            print(searchText);
          },
        );
      },
    );
  }
}

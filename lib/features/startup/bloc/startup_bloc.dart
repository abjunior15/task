import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/shared_prefs_repo.dart';
part 'startup_event.dart';
part 'startup_state.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  final SharedPrefsRepository? _sharedPreferencesRepo;

  StartupBloc({
    SharedPrefsRepository? sharedPreferencesRepo,
  })  : _sharedPreferencesRepo = sharedPreferencesRepo,
        super(StartupState(sharedPreferencesRepo: sharedPreferencesRepo)) {
    on<AppStarted>(_onAppStarted);
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<StartupState> emit,
  ) async {
    emit(state.copyWith(status: StartupStatus.loading));

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final repo = SharedPrefsRepository(sharedPreferences: prefs);

      await Future.delayed(
        const Duration(seconds: 2),
      );

      emit(
        state.copyWith(
          status: StartupStatus.loaded,
          isFirstOpen: repo.isFirstTimeOpen,
          sharedPreferencesRepo: _sharedPreferencesRepo ?? repo,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: StartupStatus.error),
      );
    }
  }
}

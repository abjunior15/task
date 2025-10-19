import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import '../../common/theme/task_theme.dart';
import '../../data/shared_prefs_repo.dart';
part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  final SharedPrefsRepository _sharedPrefsRepository;

  AppThemeBloc({
    required SharedPrefsRepository sharedPrefsRepository,
  })  : _sharedPrefsRepository = sharedPrefsRepository,
        super(const AppThemeState()) {
    on<AppThemeInitialized>(_onAppThemeInitialized);
    on<AppThemeChangeRequested>(_onAppThemeChangeRequested);
    on<ThemeModeChangeRequested>(_onThemeModeChangeRequested);
  }

  void _onAppThemeInitialized(
    AppThemeInitialized event,
    Emitter<AppThemeState> emit,
  ) async {
    emit(state.copyWith(
      theme: TaskAppTheme(),
      themeMode: _sharedPrefsRepository.getAppThemeMode(),
    ));
  }

  void _onAppThemeChangeRequested(
    AppThemeChangeRequested event,
    Emitter<AppThemeState> emit,
  ) {
    emit(state.copyWith(
      theme: event.theme,
    ));
  }

  void _onThemeModeChangeRequested(
    ThemeModeChangeRequested event,
    Emitter<AppThemeState> emit,
  ) async {
    final currentThemeMode = state.themeMode;

    final themeMode =
        currentThemeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    await _sharedPrefsRepository.setAppThemeMode(themeMode);

    emit(state.copyWith(
      themeMode: themeMode,
    ));
  }
}

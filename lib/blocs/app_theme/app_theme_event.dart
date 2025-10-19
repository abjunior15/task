part of 'app_theme_bloc.dart';

abstract class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class AppThemeInitialized extends AppThemeEvent {
  const AppThemeInitialized();

  @override
  List<Object> get props => [];
}

class AppThemeChangeRequested extends AppThemeEvent {
  final AppTheme theme;

  const AppThemeChangeRequested(this.theme);

  @override
  List<Object> get props => [theme];
}

class ThemeModeChangeRequested extends AppThemeEvent {
  // final ThemeMode themeMode;

  const ThemeModeChangeRequested();

  @override
  List<Object> get props => [];
}

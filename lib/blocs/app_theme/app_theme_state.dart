part of 'app_theme_bloc.dart';

class AppThemeState extends Equatable {
  final AppTheme? theme;
  final ThemeMode themeMode;

  const AppThemeState({
    this.theme,
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object?> get props => [
        theme,
        themeMode,
      ];

  AppThemeState copyWith({
    AppTheme? theme,
    ThemeMode? themeMode,
  }) {
    return AppThemeState(
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

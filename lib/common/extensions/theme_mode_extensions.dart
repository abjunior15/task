import 'package:flutter/material.dart';

extension ThemeModeExtensions on ThemeMode {
  String toShortString() {
    return name;
  }
}

ThemeMode themeModeFromShortString(String shortString) {
  return ThemeMode.values.firstWhere(
    (value) => value.name == shortString,
    orElse: () => ThemeMode.system,
  );
}

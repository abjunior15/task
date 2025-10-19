import 'package:task/common/extensions/theme_mode_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String isFirstOpenKey = 'is_first_time_open';
const appLanguage = "APP_LOCALE_LANGUAGE";
const userId = "USER_ID";
const userEmail = "USER_EMAIL";
const userRole = "USER_Role";
const authToken = "AUTH_TOKEN";
const appThemeModeKey = "APP_THEME_MODE";
const askedForLocationPermissionKey = "HAS_ASKED_FOR_LOCATION_PERMISSION_KEY";

class SharedPrefsRepository {
  SharedPrefsRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  bool get isFirstTimeOpen {
    return _sharedPreferences.getBool(isFirstOpenKey) ?? false;
  }

  Future<void> setFirstTimeOpen(bool firstTime) async {
    await _sharedPreferences.setBool(isFirstOpenKey, firstTime);
  }

  Future<void> setAppLanguage(String lang) async {
    await _sharedPreferences.setString(appLanguage, lang);
  }

  String? getAppLanguage() {
    if (_sharedPreferences.containsKey(appLanguage)) {
      return _sharedPreferences.getString(appLanguage);
    }
    return null;
  }

  Future<void> setUserId(String id) async {
    await _sharedPreferences.setString(userId, id);
  }

  Future<void> setAppThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.setString(
      appThemeModeKey,
      themeMode.toShortString(),
    );
  }

  ThemeMode getAppThemeMode() {
    if (_sharedPreferences.containsKey(appThemeModeKey)) {
      return themeModeFromShortString(
        _sharedPreferences.getString(appThemeModeKey) ?? '',
      );
    }
    return ThemeMode.system;
  }

  String? getUserId() {
    if (_sharedPreferences.containsKey(userId)) {
      return _sharedPreferences.getString(userId);
    }
    return null;
  }

  Future<void> setUserEmail(String email) async {
    await _sharedPreferences.setString(userEmail, email);
  }

  String? getUserEmail() {
    if (_sharedPreferences.containsKey(userEmail)) {
      return _sharedPreferences.getString(userEmail);
    }
    return null;
  }

  Future<void> removeUserId() async {
    await _sharedPreferences.remove(userId);
  }

  Future<void> setUserRole(String role) async {
    await _sharedPreferences.setString(userRole, role);
  }

  String? getUserRole() {
    if (_sharedPreferences.containsKey(userRole)) {
      return _sharedPreferences.getString(userRole);
    }
    return null;
  }

  Future<void> removeUserRole() async {
    await _sharedPreferences.remove(userRole);
  }

  Future<void> setToken(String? token) async {
    if (token == null) {
      throw ArgumentError('Token cannot be null');
    }
    await _sharedPreferences.setString(authToken, token);
  }

  String? getToken() {
    if (_sharedPreferences.containsKey(authToken)) {
      return _sharedPreferences.getString(authToken);
    }
    return null;
  }

  Future<void> removeToken() async {
    await _sharedPreferences.remove(authToken);
  }

  Future<void> setAskedForLocationPermission({
    bool hasAsked = true,
  }) async {
    await _sharedPreferences.setBool(askedForLocationPermissionKey, hasAsked);
  }

  bool hasAskedForLocationPermission() {
    return _sharedPreferences.containsKey(askedForLocationPermissionKey);
  }

  Future<void> clearUser() async {
    await removeToken();
    await removeUserId();
    await removeUserRole();
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  String? get token;

  String? get cats;

  ThemeMode get themeMode;

  Future<bool> saveToken({required String token});

  Future<void> clearToken();

  Future<bool> saveCats({required String json});

  Future<void> saveThemeMode(ThemeMode themeMode);
}

class StorageImpl implements Storage {
  static const _token = 'token';
  static const _cats = 'cats';
  static const _themeMode = 'themeMode';

  final SharedPreferences _sharedPreferences;

  StorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  String? get token => _sharedPreferences.getString(_token);

  @override
  String? get cats => _sharedPreferences.getString(_cats);

  @override
  ThemeMode get themeMode {
    String value = _sharedPreferences.getString(_themeMode) ?? 'system';

    return ThemeMode.values.firstWhere((e) => e.name == value);
  }

  @override
  Future<bool> saveToken({required String token}) => _sharedPreferences.setString(
        _token,
        token,
      );

  @override
  Future<void> clearToken() => _sharedPreferences.remove(_token);

  @override
  Future<bool> saveCats({required String json}) => _sharedPreferences.setString(
        _cats,
        json,
      );

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) => _sharedPreferences.setString(
        _themeMode,
        themeMode.name,
      );
}

import 'package:flutter/material.dart';

class LightTheme {
  static const _colorTextPrimary = Color(0xde000000);
  static const _colorTextSecondary = Color(0x8a000000);
  static const _colorPrimary = Color(0xFF607D8B);
  static const _colorSecondary = Color(0xFFFF4081);
  static const _colorCard = Color(0xFFcfd8dc);

  static const _mainFontFamily = 'OpenSans';

  static final data = ThemeData(
    primaryColor: _colorPrimary,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: _mainFontFamily,
    cardColor: _colorCard,
    textTheme: _textTheme,
    bottomNavigationBarTheme: _bottomNavigationTheme,
    appBarTheme: _appBarTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
  )..colorScheme.copyWith(secondary: _colorSecondary);

  static const _textTheme = TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.normal,
      color: _colorTextPrimary,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.normal,
      color: _colorTextSecondary,
    ),
  );

  static const _appBarTheme = AppBarTheme(color: _colorPrimary);

  static const _progressIndicatorTheme = ProgressIndicatorThemeData(color: _colorSecondary);

  static const _bottomNavigationTheme =
      BottomNavigationBarThemeData(selectedItemColor: _colorSecondary);
}

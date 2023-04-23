import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';
import 'package:flutter_sample/common/theme/theme_type.dart';

class LightTheme {
  static const Color _primary = Color(0xFF607D8B);
  static const Color _secondary = Color(0xFFFF4081);
  static const Color _disabled = Color(0xFF787878);
  static const Color _divider = Color(0xFFD5D5D5);
  static const Color _primaryBackground = Color(0xFFFFFFFF);
  static const Color _secondaryBackground = Color(0xFFF5F5F5);
  static const Color _primaryText = Color(0xde000000);
  static const Color _secondaryText = Color(0x8a000000);

  static const _mainFontFamily = 'OpenSans';

  ThemeData get data => ThemeData(
        scaffoldBackgroundColor: _primaryBackground,
        fontFamily: _mainFontFamily,
        textTheme: _textTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        appBarTheme: _appBarTheme,
        progressIndicatorTheme: _progressIndicatorTheme,
        dividerTheme: _dividerThemeData,
        bottomSheetTheme: _bottomSheetTheme,
        extensions: [
          customColors,
          themeTypeExtension,
        ],
      );

  late final customColors = const CustomColors(
    primary: _primary,
    secondary: _secondary,
    primaryBackground: _primaryBackground,
    secondaryBackground: _secondaryBackground,
    primaryText: _primaryText,
    secondaryText: _secondaryText,
  );

  late final themeTypeExtension = const ThemeTypeExtension(
    themeType: ThemeType.light,
  );

  late final _textTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.normal,
      color: _primaryText,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      color: _secondaryText,
      fontSize: 14,
    ),
  );

  late final _bottomSheetTheme = const BottomSheetThemeData(backgroundColor: _secondaryBackground);

  late final _appBarTheme = const AppBarTheme(color: _primary);

  late final _progressIndicatorTheme = const ProgressIndicatorThemeData(color: _secondary);

  late final _dividerThemeData = const DividerThemeData(
    space: 0,
    color: _divider,
  );

  late final _bottomNavigationBarTheme = const BottomNavigationBarThemeData(
    selectedItemColor: _secondary,
    backgroundColor: _secondaryBackground,
    unselectedItemColor: _disabled,
  );
}

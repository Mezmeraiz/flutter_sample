import 'package:flutter/material.dart';
import 'package:flutter_sample/common/colors.dart';

ThemeData get appTheme => ThemeData(
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: colorPrimary, secondary: colorAccent),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: colorAccent));

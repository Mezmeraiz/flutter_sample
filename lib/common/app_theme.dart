import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/common/colors.dart';

ThemeData appTheme() =>
    ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: colorPrimary,
            secondary: colorAccent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorAccent
      )
    );

AppBar appBarLight() =>
    AppBar(
      elevation: 0,
      // ignore: deprecated_member_use
      backwardsCompatibility: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      // ignore: deprecated_member_use
      brightness: Brightness.light,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
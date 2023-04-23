import 'package:flutter/material.dart';
import 'package:flutter_sample/common/theme/theme_type.dart';

const String robotoCondensed = 'Roboto Condensed';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color primary;
  final Color secondary;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color primaryText;
  final Color secondaryText;

  const CustomColors({
    required this.primary,
    required this.secondary,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? primaryText,
    Color? secondaryText,
  }) =>
      CustomColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        primaryBackground: primaryBackground ?? this.primaryBackground,
        secondaryBackground: secondaryBackground ?? this.secondaryBackground,
        primaryText: primaryText ?? this.primaryText,
        secondaryText: secondaryText ?? this.secondaryText,
      );

  @override
  ThemeExtension<CustomColors> lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }

    return CustomColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      primaryBackground: Color.lerp(primaryBackground, other.primaryBackground, t)!,
      secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
    );
  }
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  CustomColors get colors => Theme.of(this).extension<CustomColors>()!;

  ThemeType get themeType => Theme.of(this).extension<ThemeTypeExtension>()!.themeType;
}

class ThemeTypeExtension extends ThemeExtension<ThemeTypeExtension> {
  final ThemeType themeType;

  const ThemeTypeExtension({
    required this.themeType,
  });

  @override
  ThemeExtension<ThemeTypeExtension> copyWith({ThemeType? themeType}) => ThemeTypeExtension(
        themeType: themeType ?? this.themeType,
      );

  @override
  ThemeExtension<ThemeTypeExtension> lerp(ThemeExtension<ThemeTypeExtension>? other, double t) =>
      const ThemeTypeExtension(themeType: ThemeType.light);
}

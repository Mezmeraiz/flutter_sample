enum ThemeType {
  light,
  dark;

  factory ThemeType.fromString(String value) => values.firstWhere((e) => e.name == value);
}

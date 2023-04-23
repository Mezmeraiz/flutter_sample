import 'package:flutter/material.dart';
import 'package:flutter_sample/view/common/info_snack_bar.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar({required String message}) =>
      ScaffoldMessenger.of(this).showSnackBar(InfoSnackBar(message: message));
}

extension BoolParsing on String {
  bool parseBool() => this == 'true'
      ? true
      : this == 'false'
          ? false
          : throw '$this can not be parsed to boolean.';
}

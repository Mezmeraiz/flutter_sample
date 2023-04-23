import 'package:flutter/material.dart';

class InfoSnackBar extends SnackBar {
  final String message;
  InfoSnackBar({
    Key? key,
    required this.message,
  }) : super(
          key: key,
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        );
}

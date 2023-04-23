import 'package:flutter/material.dart';

Future<dynamic> showBaseBottomPage({
  required BuildContext context,
  required WidgetBuilder builder,
  bool enableDrag = true,
}) =>
    showModalBottomSheet<dynamic>(
      context: context,
      builder: builder,
      isScrollControlled: true,
      enableDrag: enableDrag,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
    );

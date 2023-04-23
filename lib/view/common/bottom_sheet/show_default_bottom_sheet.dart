import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';

import 'base_bottom_sheet.dart';

Future<dynamic> showDefaultBottomSheet({
  required BuildContext context,
  required Widget body,
  bool enableDrag = true,
}) =>
    showBaseBottomPage(
      context: context,
      enableDrag: enableDrag,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Wrap(
          children: [
            Column(
              children: [
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.colors.secondaryBackground,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                body,
              ],
            ),
          ],
        ),
      ),
    );

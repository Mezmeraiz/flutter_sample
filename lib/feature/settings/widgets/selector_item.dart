import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';

class SelectorItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const SelectorItem({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
      );
}

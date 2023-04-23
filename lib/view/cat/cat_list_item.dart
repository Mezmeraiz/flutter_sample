import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:flutter_sample/view/cat/cat_image.dart';

class CatListItem extends StatelessWidget {
  final Cat cat;
  final ValueChanged<Cat> onTap;

  const CatListItem({Key? key, required this.cat, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(cat),
        child: Column(
          children: [
            Row(
              children: [
                CatImage(cat: cat),
                Text(
                  cat.breed,
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
            const Divider()
          ],
        ),
      );
}

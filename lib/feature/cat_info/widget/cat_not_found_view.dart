import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';
import 'package:flutter_sample/generated/l10n.dart';

class CatNotFountView extends StatelessWidget {
  const CatNotFountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          S.current.catNotFound,
          style: context.textTheme.bodyLarge,
        ),
      );
}

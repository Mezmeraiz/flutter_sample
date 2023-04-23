import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';
import 'package:flutter_sample/generated/l10n.dart';

class InitialErrorView extends StatelessWidget {
  final VoidCallback? onTapReload;

  const InitialErrorView({Key? key, this.onTapReload}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.error,
              style: context.textTheme.bodyLarge,
            ),
            ElevatedButton(
              onPressed: onTapReload,
              child: Text(S.current.repeat),
            ),
          ],
        ),
      );
}

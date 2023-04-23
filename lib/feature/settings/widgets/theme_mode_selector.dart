import 'package:flutter/material.dart';
import 'package:flutter_sample/feature/settings/widgets/selector_item.dart';
import 'package:flutter_sample/generated/l10n.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectorItem(
              onTap: () => Navigator.of(context).pop(ThemeMode.system),
              title: S.current.systemTheme,
            ),
            const Divider(),
            SelectorItem(
              onTap: () => Navigator.of(context).pop(ThemeMode.light),
              title: S.current.lightTheme,
            ),
            const Divider(),
            SelectorItem(
              onTap: () => Navigator.of(context).pop(ThemeMode.dark),
              title: S.current.darkTheme,
            ),
            const Divider(),
            SelectorItem(
              onTap: () => Navigator.of(context).pop(),
              title: S.current.close,
            ),
          ],
        ),
      );
}

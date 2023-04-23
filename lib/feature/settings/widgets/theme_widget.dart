import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';
import 'package:flutter_sample/feature/settings/settings_scope.dart';
import 'package:flutter_sample/generated/l10n.dart';

class ThemeWidget extends StatelessWidget {
  final VoidCallback onThemePressed;

  const ThemeWidget({
    super.key,
    required this.onThemePressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMode currentTheme = SettingsScope.getCurrentTheme(context);
    return InkWell(
      onTap: onThemePressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                S.current.theme,
                style: context.textTheme.bodyLarge,
              ),
            ),
            Text(
              currentTheme == ThemeMode.system
                  ? S.current.systemTheme
                  : currentTheme == ThemeMode.light
                      ? S.current.lightTheme
                      : S.current.darkTheme,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

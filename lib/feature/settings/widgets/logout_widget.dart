import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/theme_extensions.dart';
import 'package:flutter_sample/generated/l10n.dart';

class LogoutWidget extends StatelessWidget {
  final VoidCallback onTapLogout;

  const LogoutWidget({
    Key? key,
    required this.onTapLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: onTapLogout,
          child: Text(
            S.current.logout,
            style: context.textTheme.bodyLarge?.copyWith(color: context.colors.secondary),
          ),
        ),
      );
}

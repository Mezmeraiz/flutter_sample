import 'package:flutter/material.dart';
import 'package:flutter_sample/generated/l10n.dart';

class NameTitleText extends StatelessWidget {
  const NameTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.current.name,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

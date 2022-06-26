import 'package:flutter/material.dart';
import 'package:flutter_sample/generated/l10n.dart';

class LocationTitleText extends StatelessWidget {
  const LocationTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.current.location,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

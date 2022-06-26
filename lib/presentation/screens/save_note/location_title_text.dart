import 'package:flutter/material.dart';

class LocationTitleText extends StatelessWidget {
  const LocationTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Location",
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

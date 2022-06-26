import 'package:flutter/material.dart';

class LocationDescriptionText extends StatelessWidget {
  const LocationDescriptionText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

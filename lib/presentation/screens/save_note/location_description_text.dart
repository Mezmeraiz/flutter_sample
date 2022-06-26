import 'package:flutter/material.dart';

class LocationDescriptionText extends StatelessWidget {
  const LocationDescriptionText({Key? key, required this.longitude, required this.latitude})
      : super(key: key);

  final double? latitude;
  final double? longitude;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$latitude $longitude",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

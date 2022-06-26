import 'package:flutter/material.dart';

class NameTitleText extends StatelessWidget {
  const NameTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Name",
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

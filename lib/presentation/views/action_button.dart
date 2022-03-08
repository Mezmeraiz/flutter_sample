import 'package:flutter/material.dart';
import 'package:flutter_sample/common/colors.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;

  const ActionButton({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: colorPrimary,
        height: 50,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

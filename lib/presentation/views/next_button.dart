import 'package:flutter/material.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.isNotEmpty,
    required this.onTap,
  }) : super(key: key);

  final bool isNotEmpty;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      left: 16,
      right: 16,
      bottom: isNotEmpty ? 16 : -100,
      child: ActionButton(
        title: "Далее",
        onTap: onTap,
      ),
    );
  }
}

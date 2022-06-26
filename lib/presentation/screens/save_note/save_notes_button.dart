import 'package:flutter/material.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';

class SaveNotesButton extends StatelessWidget {
  const SaveNotesButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(16),
        child: ActionButton(
          title: S.current.save,
          onTap: onTap,
        ),
      ),
    );
  }
}

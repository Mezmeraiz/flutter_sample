import 'package:flutter/material.dart';

class InitialLoadingView extends StatelessWidget {
  const InitialLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: CircularProgressIndicator());
}

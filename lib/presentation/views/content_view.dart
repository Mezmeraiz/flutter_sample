import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/presentation/common/base_store.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ContentView<T extends BaseStore> extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const ContentView({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<T>();
    return Observer(builder: (context) {
      if (store.state is StateInitial) {
        return const ProgressWidget();
      } else if (store.state is StateError) {
        return ErrorWidget(errorText: (store.state as StateError).errorText);
      } else {
        return Stack(fit: StackFit.expand, children: [
          builder(context),
          if (store.state is StateLoading) const ProgressWidget(),
        ]);
      }
    });
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String errorText;

  const ErrorWidget({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/icons/error.svg"),
          const SizedBox(height: 8),
          Text(errorText),
        ],
      ),
    );
  }
}

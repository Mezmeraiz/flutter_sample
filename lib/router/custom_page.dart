import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomPage<T> extends Page<T> {
  final Completer<T?>? popCompleter;
  final Widget child;

  const CustomPage({
    required this.child,
    this.popCompleter,
    LocalKey? key,
  }) : super(key: key);

  @override
  Route<T> createRoute(BuildContext context) {
    final PageRoute<T> route = kIsWeb
        ? PageRouteBuilder<T>(
            settings: this,
            pageBuilder: (_, __, ___) => child,
          )
        : MaterialPageRoute<T>(
            settings: this,
            builder: (_) => child,
          );
    route.popped.then((result) => popCompleter?.complete(result));
    return route;
  }
}

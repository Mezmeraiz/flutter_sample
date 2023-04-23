import 'package:flutter/material.dart';
import 'package:flutter_sample/router/delegate/root_router_delegate.dart';
import 'package:flutter_sample/router/scope/router_scope.dart';

class RootRouterScope extends RouterScope {
  const RootRouterScope({super.key, required super.routerDelegate, required super.child});

  @override
  RootRouterDelegate get delegate => super.delegate as RootRouterDelegate;

  static RootRouterScope of(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<RootRouterScope>()!.widget as RootRouterScope;
}

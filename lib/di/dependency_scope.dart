import 'package:flutter/widgets.dart';
import 'package:flutter_sample/di/factory/bloc_factory.dart';
import 'package:flutter_sample/di/factory/dependency_factory.dart';

class DependencyScope extends StatefulWidget {
  final DependencyFactory dependenciesFactory;
  final BlocFactory blocFactory;
  final Widget child;

  const DependencyScope({
    Key? key,
    required this.dependenciesFactory,
    required this.blocFactory,
    required this.child,
  }) : super(key: key);

  @override
  State<DependencyScope> createState() => _DependencyScopeState();

  static DependencyFactory getDependenciesFactory(BuildContext context) => _scopeOf(context).dependenciesFactory;

  static BlocFactory getBlocFactory(BuildContext context) => _scopeOf(context).blocFactory;

  static DependencyScope _scopeOf(BuildContext context) =>
      (context.getElementForInheritedWidgetOfExactType<_InheritedDependencyScope>()!.widget
              as _InheritedDependencyScope)
          .state
          .widget;
}

class _DependencyScopeState extends State<DependencyScope> {
  @override
  Widget build(BuildContext context) => _InheritedDependencyScope(
        state: this,
        child: widget.child,
      );

  @override
  void dispose() {
    widget.dependenciesFactory.close();
    super.dispose();
  }
}

class _InheritedDependencyScope extends InheritedWidget {
  final _DependencyScopeState state;

  const _InheritedDependencyScope({
    required Widget child,
    required this.state,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

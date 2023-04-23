import 'package:flutter_sample/router/base_router_delegate.dart';
import 'package:flutter_sample/router/delegate/root_router_delegate.dart';
import 'package:flutter_sample/router/route_configuration.dart';

abstract class NestedRouterDelegate extends BaseRouterDelegate {
  String get prefix;

  NestedRouterDelegate() {
    currentRouteConfiguration = RouteConfiguration(location: prefix);
  }

  void subscribeToRootRouterDelegate(RootRouterDelegate rootRouterDelegate) {
    rootRouterDelegate.addListener(() {
      if ((rootRouterDelegate.currentConfiguration?.location.startsWith(prefix) ?? false) &&
          currentRouteConfiguration != rootRouterDelegate.currentConfiguration) {
        currentRouteConfiguration = rootRouterDelegate.currentConfiguration;
        notifyListeners();
      }
    });
  }
}

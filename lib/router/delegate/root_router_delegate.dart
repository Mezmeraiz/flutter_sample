import 'package:flutter/material.dart';
import 'package:flutter_sample/feature/auth/auth_screen.dart';
import 'package:flutter_sample/feature/main/main_screen.dart';
import 'package:flutter_sample/router/base_router_delegate.dart';
import 'package:flutter_sample/router/custom_page.dart';
import 'package:flutter_sample/router/root_route_information_parser.dart';
import 'package:flutter_sample/router/route_configuration.dart';

class RootRouterDelegate extends BaseRouterDelegate {
  void subscribeToNestedRouter(RouterDelegate<dynamic> nestedRouterDelegate) {
    nestedRouterDelegate.addListener(() {
      if (currentRouteConfiguration != nestedRouterDelegate.currentConfiguration) {
        currentRouteConfiguration = nestedRouterDelegate.currentConfiguration as RouteConfiguration?;
        notifyListeners();
      }
    });
  }

  @override
  Widget build(BuildContext context) => currentConfiguration != null ? super.build(context) : Container();

  @override
  List<Page<dynamic>> buildPages() {
    if (currentRouteConfiguration!.location.startsWith('/$catPath') ||
        currentRouteConfiguration!.location.startsWith('/$savedPath') ||
        currentRouteConfiguration!.location.startsWith('/$settingsPath')) {
      return [
        const CustomPage(
          key: ValueKey('main'),
          child: MainScreen(),
        )
      ];
    } else {
      return super.buildPages();
    }
  }

  @override
  Widget getScreen(String location, Map<String, Object?>? state) {
    late Widget screen;
    final uri = Uri.parse(location);
    switch (uri.path) {
      case authPath:
        screen = const AuthScreen();
        break;
      default:
        screen = Container();
    }
    return screen;
  }

  int get currentTabIndex {
    if (currentRouteConfiguration!.location.startsWith('/$catPath')) {
      return 0;
    } else if (currentRouteConfiguration!.location.startsWith('/$savedPath')) {
      return 1;
    } else if (currentRouteConfiguration!.location.startsWith('/$settingsPath')) {
      return 2;
    } else {
      return 0;
    }
  }
}

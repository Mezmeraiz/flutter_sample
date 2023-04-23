import 'package:flutter/material.dart';
import 'package:flutter_sample/feature/cat/cat_screen.dart';
import 'package:flutter_sample/feature/cat_info/cat_info_screen.dart';
import 'package:flutter_sample/router/nested_router_delegate.dart';
import 'package:flutter_sample/router/root_route_information_parser.dart';

class CatRouterDelegate extends NestedRouterDelegate {
  @override
  String get prefix => '/$catPath';

  // @override
  // RouteConfiguration? get currentConfiguration => currentRouteConfiguration;

  // @override
  // Widget build(BuildContext context) => RouterScope(
  //       routerDelegate: this,
  //       child: getPageBuilder(),
  //     );

  @override
  Widget getScreen(String location, Map<String, Object?>? state) {
    late Widget screen;
    final uri = Uri.parse(location);
    switch (uri.path) {
      case catPath:
        screen = const CatScreen();
        break;
      case catInfoPath:
        Map<String, String> arguments = uri.queryParameters;
        screen = CatInfoScreen(
          id: arguments['id']!,
          saved: arguments['saved']!.toLowerCase() == 'true',
        );
        break;
      default:
        screen = Container();
    }
    return screen;
  }
}

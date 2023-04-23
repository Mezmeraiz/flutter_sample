import 'package:flutter/material.dart';
import 'package:flutter_sample/feature/settings/settings_screen.dart';
import 'package:flutter_sample/router/nested_router_delegate.dart';
import 'package:flutter_sample/router/root_route_information_parser.dart';

class SettingsRouterDelegate extends NestedRouterDelegate {
  @override
  String get prefix => '/$settingsPath';

  @override
  Widget getScreen(String location, Map<String, Object?>? state) {
    late Widget screen;
    final uri = Uri.parse(location);
    switch (uri.path) {
      case settingsPath:
        screen = const SettingsScreen();
        break;
      default:
        screen = Container();
    }
    return screen;
  }
}

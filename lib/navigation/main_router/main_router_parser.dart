import 'package:flutter/material.dart';
import 'package:flutter_sample/navigation/main_router/main_router_configuration.dart';

class MainRouterParser extends RouteInformationParser<MainRouterConfiguration> {
  @override
  Future<MainRouterConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 2) {
      final currentMainTab = int.parse(uri.pathSegments[1]);
      return MainRouterConfiguration.main(currentMainTab);
    } else if (uri.pathSegments.length == 4) {
      final noteId = int.parse(uri.pathSegments[3]);
      return MainRouterConfiguration.noteInfo(noteId);
    } else {
      return MainRouterConfiguration.main(0);
    }
  }

  @override
  RouteInformation? restoreRouteInformation(
      MainRouterConfiguration configuration) {
    if (configuration.isMainPage) {
      return RouteInformation(
          location: '/main/${configuration.currentMainTab}');
    } else if (configuration.isNoteInfoPage) {
      return RouteInformation(
          location:
              '/main/${configuration.currentMainTab}/note/${configuration.noteId}');
    } else {
      return null;
    }
  }
}

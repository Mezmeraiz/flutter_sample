import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common/extensions/common_extensions.dart';
import 'package:flutter_sample/data/storage/storage.dart';
import 'package:flutter_sample/router/route_configuration.dart';

const String authPath = 'auth';
const String catPath = 'cat';
const String savedPath = 'saved';
const String catInfoPath = 'cat_info';
const String settingsPath = 'settings';

final legalPaths = [
  [authPath],
  [catPath],
  [savedPath],
  [settingsPath],
  [catPath, catInfoPath],
  [savedPath, catInfoPath],
];

class RootRouteInformationParser extends RouteInformationParser<RouteConfiguration> {
  final Storage storage;

  RootRouteInformationParser({required this.storage});

  @override
  Future<RouteConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    String location = normalizeUrl(routeInformation.location ?? '/$catPath');

    return SynchronousFuture<RouteConfiguration>(
      RouteConfiguration(
        location: location,
        state: routeInformation.state is Map<String, Object?> ? routeInformation.state as Map<String, Object?> : null,
      ),
    );
  }

  @override
  RouteInformation restoreRouteInformation(RouteConfiguration configuration) => RouteInformation(
        location: configuration.location,
        state: configuration.state,
      );

  String normalizeUrl(String location) {
    location = '/${location.split('/').where((element) => element.isNotEmpty).toSet().toList().join('/')}';
    if (storage.token == null) {
      location = '/$authPath';
    } else if (location.startsWith('/$authPath') || location == '/') {
      location = '/$catPath';
    } else {
      List<String> paths = location.split('/').where((element) => element.isNotEmpty).toList();
      List<String> pathsWithoutParams = [];
      for (final String path in paths) {
        if (path.contains('?')) {
          final uri = Uri.parse(path);
          if (!checkForParams(uri)) {
            location = '/$catPath';
            break;
          } else {
            pathsWithoutParams.add(uri.path);
          }
        } else {
          pathsWithoutParams.add(path);
        }
      }
      if (location != '/$catPath' &&
          !legalPaths.any((element) => const ListEquality().equals(pathsWithoutParams, element))) {
        location = '/$catPath';
      }
    }
    return location;
  }

  bool checkForParams(Uri uri) {
    try {
      switch (uri.path) {
        case catInfoPath:
          if (uri.queryParameters['id']!.isEmpty) return false;
          uri.queryParameters['saved']!.parseBool();
          break;
        default:
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common/constants.dart';
import 'package:flutter_sample/common/theme/dark_theme.dart';
import 'package:flutter_sample/common/theme/light_theme.dart';
import 'package:flutter_sample/data/storage/storage.dart';
import 'package:flutter_sample/router/delegate/root_router_delegate.dart';
import 'package:flutter_sample/router/root_route_information_parser.dart';
import 'package:sqflite/sqflite.dart';

abstract class DependencyFactory {
  Database? get database;

  Storage get storage;

  Dio get dio;

  RootRouterDelegate get rootRouterDelegate;

  RouteInformationParser<Object> get rootRouteInformationParser;

  RouteInformationProvider get rootRouteInformationProvider;

  BackButtonDispatcher get rootBackButtonDispatcher;

  ThemeData get lightThemeData;

  ThemeData get darkThemeData;

  void close();
}

class DependencyFactoryImpl implements DependencyFactory {
  DependencyFactoryImpl({
    Database? database,
    required Storage storage,
  })  : _database = database,
        _storage = storage;

  final Database? _database;

  final Storage _storage;

  Dio? _dio;

  RootRouterDelegate? _rootRouterDelegate;

  RouteInformationParser<Object>? _rootRouteInformationParser;

  RouteInformationProvider? _rootRouteInformationProvider;

  BackButtonDispatcher? _rootBackButtonDispatcher;

  ThemeData? _lightThemeData;

  ThemeData? _darkThemeData;

  @override
  Database? get database => _database;

  @override
  Storage get storage => _storage;

  @override
  Dio get dio => _dio ??= Dio(BaseOptions(baseUrl: Constants.baseUrl));

  @override
  BackButtonDispatcher get rootBackButtonDispatcher => _rootBackButtonDispatcher ??= RootBackButtonDispatcher();

  @override
  RouteInformationParser<Object> get rootRouteInformationParser =>
      _rootRouteInformationParser ??= RootRouteInformationParser(storage: _storage);

  @override
  RouteInformationProvider get rootRouteInformationProvider =>
      _rootRouteInformationProvider ??= PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(location: WidgetsBinding.instance.window.defaultRouteName),
      );

  @override
  RootRouterDelegate get rootRouterDelegate => _rootRouterDelegate ??= RootRouterDelegate();

  @override
  ThemeData get lightThemeData => _lightThemeData ??= LightTheme().data;

  @override
  ThemeData get darkThemeData => _darkThemeData ??= DarkTheme().data;

  @override
  void close() {
    // TODO implement close
  }
}

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/navigation/main_router/main_navigation.dart';
import 'package:flutter_sample/navigation/main_router/main_router_configuration.dart';
import 'package:flutter_sample/navigation/main_router/main_router_store.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:mobx/mobx.dart';

class MainRouterDelegate extends RouterDelegate<MainRouterConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<MainRouterConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final MainRouterStore _mainRouterStore;
  final List<Page> _pages = [];
  final ScreenFactory _screenFactory = sl<ScreenFactory>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  MainRouterDelegate(this._mainRouterStore) {
    reaction(
        (_) => _mainRouterStore.currentConfiguration, (_) => notifyListeners());
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
      onGenerateRoute: MainNavigation.generateRoute,
    );
  }

  List<Page> buildPages() {
    if (_mainRouterStore.currentConfiguration != null) {
      if (_mainRouterStore.currentConfiguration!.isMainPage) {
        _pages.clear();
        addPage(_screenFactory.makeMainScreen(
            _mainRouterStore.currentConfiguration!.currentMainTab!));
      } else if (_mainRouterStore.currentConfiguration!.isNoteInfoPage) {
        _pages.clear();
        addPage(_screenFactory.makeMainScreen(
            _mainRouterStore.currentConfiguration!.currentMainTab!));
        addPage(
            _screenFactory.makeNoteInfoScreen(_mainRouterStore.currentNote!));
      }
    }
    return List.of(_pages);
  }

  addPage(Widget widget) {
    _pages.add(MaterialPage(child: widget));
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  pop() {
    _pages.removeLast();
    _mainRouterStore.clearConfiguration();
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<void> setNewRoutePath(MainRouterConfiguration configuration) async {
    await _mainRouterStore.setNewConfiguration(configuration);
  }
}

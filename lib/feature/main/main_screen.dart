import 'package:flutter/material.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/router/base_router_delegate.dart';
import 'package:flutter_sample/router/delegate/nested/cat_router_delegate.dart';
import 'package:flutter_sample/router/delegate/nested/saved_router_delegate.dart';
import 'package:flutter_sample/router/delegate/nested/settings_router_delegate.dart';
import 'package:flutter_sample/router/root_route_information_parser.dart';
import 'package:flutter_sample/router/tab_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Map<String, BaseRouterDelegate> delegateMap;

  @override
  void initState() {
    delegateMap = {
      catPath: CatRouterDelegate(),
      savedPath: SavedRouterDelegate(),
      settingsPath: SettingsRouterDelegate(),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TabRouter(
        delegateMap: delegateMap,
        builder: (context, child) {
          final tabRouter = TabRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabRouter.currentTab,
              type: BottomNavigationBarType.fixed,
              onTap: (index) => TabRouter.of(context).changeTab(index),
              items: [
                BottomNavigationBarItem(icon: const Icon(Icons.list), label: S.current.cats),
                BottomNavigationBarItem(icon: const Icon(Icons.save), label: S.current.saved),
                BottomNavigationBarItem(icon: const Icon(Icons.settings), label: S.current.settings),
              ],
            ),
          );
        },
      );
}

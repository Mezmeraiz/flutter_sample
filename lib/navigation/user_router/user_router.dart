import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:flutter_sample/navigation/user_router/user_router_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class UserRouter extends StatefulWidget {
  static const route = "user_router";

  const UserRouter({Key? key}) : super(key: key);

  @override
  UserRouterState createState() => UserRouterState();
}

class UserRouterState extends State<UserRouter> {
  late final ScreenFactory _screenFactory;

  late final UserRouterStore _userRouterStore;

  final List<Page> _pages = [];

  @override
  void initState() {
    super.initState();
    _screenFactory = sl<ScreenFactory>();
    _userRouterStore = context.read<UserRouterStore>();
    when((_) => _userRouterStore.currentAction == UserRouterAction.close,
        () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Observer(builder: (_) {
      return Navigator(
        onPopPage: _onPopPage,
        pages: buildPages(),
      );
    }), onWillPop: () {
      return popRoute();
    });
  }

  List<Page> buildPages() {
    switch (_userRouterStore.currentAction) {
      case UserRouterAction.initial:
        addPage(_screenFactory.makePhotoScreen());
        break;
      case UserRouterAction.next:
        if (_pages.length == 1) {
          addPage(_screenFactory.makeMapScreen());
          if (_userRouterStore.reSelection) {
            addPage(_screenFactory.makeSaveUserScreen());
          }
        } else if (_pages.length == 2) {
          _userRouterStore.reSelection = true;
          addPage(_screenFactory.makeSaveUserScreen());
        }
        break;
      case UserRouterAction.backToPhoto:
        _pages.length = _pages.length - 2;
        break;
      case UserRouterAction.backToMap:
        _pages.length = _pages.length - 1;
        break;
      default:
        break;
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
  }

  bool canPop() {
    return _pages.length > 1;
  }

  Future<bool> popRoute() {
    if (canPop()) {
      pop();
      _userRouterStore.currentAction = UserRouterAction.rebuild;
      return Future.value(false);
    }
    return Future.value(true);
  }
}

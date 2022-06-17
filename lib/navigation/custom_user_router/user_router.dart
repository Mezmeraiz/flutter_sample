import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/data/user_router_repository_impl.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router_bloc.dart';
import 'package:flutter_sample/presentation/screens/map/map_screen.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_screen.dart';
import 'package:flutter_sample/presentation/screens/save_note/save_note_screen.dart';
import 'package:provider/provider.dart';

class UserRouter extends StatelessWidget {
  static const route = "user_router";

  const UserRouter({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Provider<UserRouterRepository>(
      create: (context) => UserRouterRepositoryImpl(user: user),
      child: BlocProvider<UserRouterBloc>(
        create: (context) => UserRouterBloc(),
        child: UserRouterView(),
      ),
    );
  }
}

class UserRouterView extends StatelessWidget {
  UserRouterView({Key? key}) : super(key: key);

  final List<Page> _pages = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BlocBuilder<UserRouterBloc, UserRouterState>(
          buildWhen: (p, c) => p.reSelection == c.reSelection,
          builder: (context, state) {
            return Navigator(
              onPopPage: _onPopPage,
              pages: buildPages(context, state),
            );
          },),
      onWillPop: () => popRoute(context),
    );
  }

  List<Page> buildPages(BuildContext context, UserRouterState state) {
    switch (state.action) {
      case UserRouterAction.initial:
        addPage(const PhotoScreen());
        break;
      case UserRouterAction.next:
        if (_pages.length == 1) {
          addPage(const MapScreen());
          if (state.reSelection) {
            addPage(const SaveNoteScreen());
          }
        } else if (_pages.length == 2) {
          context.read<UserRouterBloc>().add(const UserRouterEvent.reSelection(reSelection: true));
          addPage(const SaveNoteScreen());
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

  Future<bool> popRoute(BuildContext context) {
    if (canPop()) {
      pop();
      context
          .read<UserRouterBloc>()
          .add(const UserRouterEvent.action(action: UserRouterAction.rebuild));
      return Future.value(false);
    }
    return Future.value(true);
  }
}

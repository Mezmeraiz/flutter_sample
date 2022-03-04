import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/navigation/user_router/user_router.dart';
import 'package:flutter_sample/presentation/screens/main/main_screen.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/presentation/screens/map/map_screen.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_screen.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';
import 'package:flutter_sample/presentation/screens/save_user/save_user_screen.dart';

class Navigation {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    final screenFactory = sl<ScreenFactory>();
    switch (settings.name) {
      case MainScreen.route:
        screen = screenFactory.makeMainScreen();
        break;
      case PhotoScreen.route:
        screen = screenFactory.makePhotoScreen();
        break;
      case PhotoInfoScreen.route:
        final photo = settings.arguments as Photo;
        screen = screenFactory.makePhotoInfoScreen(photo);
        break;
      case MapScreen.route:
        screen = screenFactory.makeMapScreen();
        break;
      case SaveUserScreen.route:
        screen = screenFactory.makeSaveUserScreen();
        break;
      case UserRouter.route:
        final user = settings.arguments as User;
        screen = screenFactory.makeUserRouter(user);
        break;
      default:
        screen = Container();
    }

    return MaterialPageRoute(builder: (_) => screen);
  }
}

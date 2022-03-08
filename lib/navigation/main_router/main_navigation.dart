import 'package:flutter/material.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:flutter_sample/navigation/user_router/user_router.dart';
import 'package:flutter_sample/presentation/screens/main/main_screen.dart';
import 'package:flutter_sample/presentation/screens/note_info/note_info_screen.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';

class MainNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    final screenFactory = sl<ScreenFactory>();
    switch (settings.name) {
      case MainScreen.route:
        screen = screenFactory.makeMainScreen(0);
        break;
      case PhotoInfoScreen.route:
        final photo = settings.arguments as Photo;
        screen = screenFactory.makePhotoInfoScreen(photo);
        break;
      case NoteInfoScreen.route:
        final note = settings.arguments as Note;
        screen = screenFactory.makeNoteInfoScreen(note);
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

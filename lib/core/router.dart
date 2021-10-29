import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';
import 'package:flutter_sample/screens/photo/presentation/photo_screen.dart';
import 'package:flutter_sample/screens/photo_info/presentation/photo_info_screen.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case PhotoScreen.route:
        screen = PhotoScreen();
        break;
      case PhotoInfoScreen.route:
        screen = PhotoInfoScreen(settings.arguments as Photo);
        break;
      default:
        screen =  Container();
    }
    return MaterialPageRoute(builder: (_) => screen);
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/screens/chart/domain/entities/company.dart';
import 'package:flutter_sample/screens/chart/presentation/chart_screen.dart';
import 'package:flutter_sample/screens/chart_info/presentation/chart_info_screen.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case ChartScreen.route:
        screen = ChartScreen();
        break;
      case ChartInfoScreen.route:
        screen = ChartInfoScreen(settings.arguments as Company);
        break;
      default:
        screen =  Container();
    }
    return MaterialPageRoute(builder: (_) => screen);
  }

}
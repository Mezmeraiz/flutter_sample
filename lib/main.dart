import 'dart:convert';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/common/app_theme.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/navigation/navigation.dart';
import 'package:flutter_sample/presentation/screens/main/main_screen.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_screen.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/stores/geo_store.dart';
import 'package:provider/provider.dart';

import 'package:flutter_sample/navigation/screen_factory.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const ChartApp());
}

class ChartApp extends StatelessWidget {
  const ChartApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ...getStores()
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          initialRoute: MainScreen.route,
          onGenerateRoute: Navigation.generateRoute,
        ));
  }
}

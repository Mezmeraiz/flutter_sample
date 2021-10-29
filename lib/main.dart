import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/injection_container.dart';
import 'package:flutter_sample/screens/photo/presentation/photo_cubit.dart';
import 'package:flutter_sample/screens/photo/presentation/photo_screen.dart';

import 'core/router.dart';

void main() {
  setup();
  runApp(const ChartApp());
}

class ChartApp extends StatelessWidget {
  const ChartApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => sl<PhotoCubit>())],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: PhotoScreen.route,
          onGenerateRoute: Router.generateRoute,
        )
    );
  }
}



import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/injection_container.dart';
import 'package:flutter_sample/screens/chart/presentation/chart_cubit.dart';
import 'package:flutter_sample/screens/chart/presentation/chart_screen.dart';

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
        providers: [BlocProvider(create: (_) => sl<ChartCubit>())],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: ChartScreen.route,
          onGenerateRoute: Router.generateRoute,
        )
    );
  }
}



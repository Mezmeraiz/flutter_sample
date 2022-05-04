import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/common/app_theme.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/navigation/main_router/main_router_delegate.dart';
import 'package:flutter_sample/navigation/main_router/main_router_parser.dart';
import 'package:flutter_sample/navigation/main_router/main_router_store.dart';
import 'package:flutter_sample/presentation/screens/note/store/note_store.dart';
import 'package:flutter_sample/presentation/stores/geo_store.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const SampleApp());
}

class SampleApp extends StatefulWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  SampleAppState createState() => SampleAppState();
}

class SampleAppState extends State<SampleApp> {
  late final MainRouterStore mainRouterStore;
  late final MainRouterDelegate mainRouterDelegate;
  late final MainRouterParser mainRouterParser;

  @override
  void initState() {
    super.initState();
    mainRouterStore = MainRouterStore(notesInteractor: sl<NotesInteractor>());
    mainRouterDelegate = MainRouterDelegate(mainRouterStore);
    mainRouterParser = sl<MainRouterParser>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider.value(value: mainRouterStore),
          Provider(create: (_) => GeoStore()),
          Provider(create: (_) => NoteStore(sl<NotesInteractor>()))
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Sample',
          theme: LightTheme.data,
          routerDelegate: mainRouterDelegate,
          routeInformationParser: mainRouterParser,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ));
  }

}
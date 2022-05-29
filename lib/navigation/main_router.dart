import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sample/domain/entities/photo.dart';

class RouteName {
  static const String main = 'main';
  static const String noteInfo = 'noteInfo';
  static const String photoInfo = 'photoInfo';
  static const String userRouter = 'userRouter';
}

class MainRouter {
  late final ScreenFactory screenFactory;

  MainRouter(this.screenFactory);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        redirect: (state) => state.namedLocation(RouteName.main, params: {"tab": "0"}),
      ),
      GoRoute(
          name: RouteName.main,
          path: '/main/:tab',
          builder: (context, state) =>
              screenFactory.makeMainScreen(int.parse(state.params["tab"]!)),
          routes: [
            GoRoute(
                path: 'noteInfo',
                builder: (context, state) {
                  Note note = state.extra as Note;
                  return screenFactory.makeNoteInfoScreen(note);
                }),
          ]),
      GoRoute(
        name: RouteName.noteInfo,
        path: '/noteInfo',
        builder: (context, state) {
          Note note = state.extra as Note;
          return screenFactory.makeNoteInfoScreen(note);
        },
      ),
      GoRoute(
        name: RouteName.photoInfo,
        path: '/photoInfo',
        builder: (context, state) {
          Photo photo = state.extra as Photo;
          return screenFactory.makePhotoInfoScreen(photo);
        },
      ),
      GoRoute(
        name: RouteName.userRouter,
        path: '/userRouter',
        builder: (context, state) {
          User user = state.extra as User;
          return screenFactory.makeUserRouter(user);
        },
      ),
    ],
  );
}

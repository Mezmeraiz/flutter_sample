import 'package:auto_route/auto_route.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router.dart';
import 'package:flutter_sample/presentation/screens/main/main_screen.dart';
import 'package:flutter_sample/presentation/screens/note/note_screen.dart';
import 'package:flutter_sample/presentation/screens/note_info/note_info_screen.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';
import 'package:flutter_sample/presentation/screens/tab/tab_screen.dart';

export 'main_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    RedirectRoute(path: '/', redirectTo: 'main'),
    AutoRoute<void>(
      path: 'main',
      page: MainScreen,
      children: [
        AutoRoute<void>(
          path: 'tab',
          name: 'TabRouter',
          page: EmptyRouterScreen,
          children: [
            AutoRoute<void>(
              path: '',
              page: TabScreen,
            ),
            AutoRoute<void>(
              path: 'userRouter',
              page: UserRouterScreen,
            ),
          ],
        ),
        AutoRoute<void>(
          path: 'note',
          name: 'NoteRouter',
          page: EmptyRouterScreen,
          children: [
            AutoRoute<void>(
              path: '',
              page: NoteScreen,
            ),
            AutoRoute<void>(
              path: 'noteInfo',
              page: NoteInfoScreen,
            ),
            AutoRoute<void>(
              path: 'photoInfo',
              page: PhotoInfoScreen,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $MainRouter {}

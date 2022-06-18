import 'package:auto_route/auto_route.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router.dart';
import 'package:flutter_sample/presentation/screens/main/main_screen.dart';
import 'package:flutter_sample/presentation/screens/note_info/note_info_screen.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';

export 'main_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    RedirectRoute(path: '/', redirectTo: 'main/0'),
    AutoRoute<void>(
      path: 'main/:currentIndex',
      page: MainScreen,
    ),
    AutoRoute<void>(
      path: 'noteInfo',
      page: NoteInfoScreen,
    ),
    AutoRoute<void>(
      path: 'photoInfo',
      page: PhotoInfoScreen,
    ),
    AutoRoute<void>(
      path: 'photo',
      page: UserRouterScreen,
    ),
  ],
)
class $MainRouter {}

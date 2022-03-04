import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:flutter_sample/domain/users_interactor.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/navigation/user_router/user_router.dart';
import 'package:flutter_sample/navigation/user_router/user_router_store.dart';
import 'package:flutter_sample/presentation/screens/main/main_screen.dart';
import 'package:flutter_sample/presentation/screens/map/map_screen.dart';
import 'package:flutter_sample/presentation/screens/map/store/map_store.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/screens/save_user/save_user_screen.dart';
import 'package:flutter_sample/presentation/screens/saved/saved_screen.dart';
import 'package:flutter_sample/presentation/screens/tab/tab_screen.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_screen.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';
import 'package:flutter_sample/presentation/screens/user/store/user_store.dart';
import 'package:flutter_sample/presentation/screens/user/user_screen.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainScreen() {
    return const MainScreen();
  }

  Widget makeTabScreen() {
    return const TabScreen();
  }

  Widget makeSavedScreen() {
    return const SavedScreen();
  }

  Widget makePhotoScreen() {
    return const PhotoScreen();
  }

  Widget makePhotoInfoScreen(Photo photo) {
    return PhotoInfoScreen(photo);
  }

  Widget makeUserScreen(String? gender) {
    return Provider(
      create: (_) => UserStore(gender, sl<UsersInteractor>()),
      child: const UserScreen(),
    );
  }

  Widget makeUserRouter(User user) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PhotoStore(photosInteractor: sl<PhotosInteractor>()),),
        Provider(create: (_) => MapStore(),),
        Provider(create: (_) => UserRouterStore(user: user),)
      ],
      child: const UserRouter(),
    );
  }

  Widget makeMapScreen() {
    return const MapScreen();
  }

  Widget makeSaveUserScreen() {
    return const SaveUserScreen();
  }
}

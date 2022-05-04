import 'package:flutter/material.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:flutter_sample/domain/users_interactor.dart';
import 'package:flutter_sample/navigation/main_router/main_router_store.dart';
import 'package:flutter_sample/navigation/user_router/user_router.dart';
import 'package:flutter_sample/navigation/user_router/user_router_store.dart';
import 'package:flutter_sample/presentation/screens/main/main_screen.dart';
import 'package:flutter_sample/presentation/screens/map/map_screen.dart';
import 'package:flutter_sample/presentation/screens/map/store/map_store.dart';
import 'package:flutter_sample/presentation/screens/note/note_screen.dart';
import 'package:flutter_sample/presentation/screens/note/store/note_store.dart';
import 'package:flutter_sample/presentation/screens/note_info/note_info_screen.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_screen.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';
import 'package:flutter_sample/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_sample/presentation/screens/profile/store/profile_store.dart';
import 'package:flutter_sample/presentation/screens/save_note/save_note_screen.dart';
import 'package:flutter_sample/presentation/screens/tab/tab_screen.dart';
import 'package:flutter_sample/presentation/screens/user/store/user_store.dart';
import 'package:flutter_sample/presentation/screens/user/user_screen.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainScreen(int initialPage) {
    return MainScreen(
      currentIndex: initialPage,
    );
  }

  Widget makeTabScreen() {
    return const TabScreen();
  }

  Widget makeNoteScreen() {
    return const NoteScreen();
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
    final photoStore = PhotoStore(photosInteractor: sl<PhotosInteractor>());
    final mapStore = MapStore();
    return MultiProvider(
      providers: [
        Provider.value(value: photoStore),
        Provider.value(value: mapStore),
        Provider(
          create: (context) => UserRouterStore(
              user: user,
              photoStore: photoStore,
              mapStore: mapStore,
              noteStore: context.read<NoteStore>(),
              mainRouterStore: context.read<MainRouterStore>(),
              notesInteractor: sl<NotesInteractor>()),
        )
      ],
      child: const UserRouter(),
    );
  }

  Widget makeMapScreen() {
    return const MapScreen();
  }

  Widget makeSaveUserScreen() {
    return const SaveNoteScreen();
  }

  Widget makeNoteInfoScreen(Note note) {
    return NoteInfoScreen(note: note);
  }

  Widget makeProfileScreen() {
    return Provider(
      create: (_) => ProfileStore(),
      child: const ProfileScreen(),
    );
  }
}

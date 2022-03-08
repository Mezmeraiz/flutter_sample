import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/navigation/main_router/main_router_configuration.dart';
import 'package:flutter_sample/navigation/main_router/main_router_store.dart';
import 'package:flutter_sample/presentation/screens/map/store/map_store.dart';
import 'package:flutter_sample/presentation/screens/note/store/note_store.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:mobx/mobx.dart';

part 'user_router_store.g.dart';

class UserRouterStore = UserRouterStoreBase with _$UserRouterStore;

abstract class UserRouterStoreBase with Store {
  final User user;
  final PhotoStore photoStore;
  final MapStore mapStore;
  final NoteStore noteStore;
  final MainRouterStore mainRouterStore;
  final NotesInteractor notesInteractor;

  @observable
  UserRouterAction currentAction = UserRouterAction.initial;

  var reSelection = false;

  UserRouterStoreBase(
      {required this.user,
      required this.photoStore,
      required this.mapStore,
      required this.noteStore,
      required this.mainRouterStore,
      required this.notesInteractor});

  saveNote() async {
    final noteId = await notesInteractor.saveNote(
        user,
        photoStore.selectedPhotos.toList(),
        mapStore.markerPosition!.latitude,
        mapStore.markerPosition!.longitude);
    mainRouterStore
        .setNewConfiguration(MainRouterConfiguration.noteInfo(noteId));
    noteStore.fetchNotes();
    currentAction = UserRouterAction.close;
  }
}

enum UserRouterAction { initial, next, backToPhoto, backToMap, close, rebuild }

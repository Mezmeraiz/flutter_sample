import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/presentation/screens/map/store/map_store.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:mobx/mobx.dart';

part 'user_router_store.g.dart';

class UserRouterStore = UserRouterStoreBase with _$UserRouterStore;

abstract class UserRouterStoreBase with Store {
  final User user;
  final PhotoStore photoStore;
  final MapStore mapStore;
  final NotesInteractor notesInteractor;

  @observable
  UserRouterAction currentAction = UserRouterAction.initial;

  var reSelection = false;

  UserRouterStoreBase(
      {required this.user,
      required this.photoStore,
      required this.mapStore,
      required this.notesInteractor});

  saveNote() {
    notesInteractor.saveNote(user, photoStore.selectedPhotos.toList(),
        mapStore.markerPosition!.latitude, mapStore.markerPosition!.longitude);
  }
}

enum UserRouterAction { initial, next, backToPhoto, backToMap, close, rebuild }

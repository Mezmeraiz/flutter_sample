import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/navigation/main_router/main_router_configuration.dart';
import 'package:mobx/mobx.dart';

part 'main_router_store.g.dart';

class MainRouterStore = MainRouterStoreBase with _$MainRouterStore;

abstract class MainRouterStoreBase with Store {
  @observable
  MainRouterConfiguration? _currentConfiguration =
      MainRouterConfiguration.main(0);

  @computed
  MainRouterConfiguration? get currentConfiguration => _currentConfiguration;

  final NotesInteractor notesInteractor;

  Note? currentNote;

  MainRouterStoreBase({required this.notesInteractor});

  @action
  setNewConfiguration(MainRouterConfiguration configuration) async {
    if (configuration.isNoteInfoPage) {
      currentNote = await notesInteractor.getNoteById(configuration.noteId!);
    }
    _currentConfiguration = configuration;
  }

  clearConfiguration() {
    _currentConfiguration = null;
  }
}

import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:mobx/mobx.dart';

part 'note_store.g.dart';

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  final NotesInteractor notesInteractor;

  NoteStoreBase(this.notesInteractor) {
    fetchNotes();
  }

  @observable
  var notes = ObservableList<Note>();

  @action
  fetchNotes() async {
    final notes = await notesInteractor.getNotes();
    this.notes.clear();
    this.notes.addAll(notes);
  }
}

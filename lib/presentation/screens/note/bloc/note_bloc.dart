import 'package:bloc/bloc.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_bloc.freezed.dart';

@freezed
class NoteEvent with _$NoteEvent {
  const NoteEvent._();

  const factory NoteEvent.fetch() = FetchNoteEvent;
}

@freezed
class NoteState with _$NoteState {
  const factory NoteState({required List<Note> notes}) = _NoteState;
}

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({required this.notesInteractor}) : super(const NoteState(notes: [])) {
    on<FetchNoteEvent>(_fetchNotes);
  }

  final NotesInteractor notesInteractor;

  Future<void> _fetchNotes(
    FetchNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    final notes = await notesInteractor.getNotes();
    emit(state.copyWith(notes: notes));
  }
}

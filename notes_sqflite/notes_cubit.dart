/*
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database_helper.dart';
import 'note_model.dart';

abstract class NotesStates {}

class NotesInitial extends NotesStates {}

class NotesLoading extends NotesStates {}

class NotesLoaded extends NotesStates {
  final List<Map<String, dynamic>> notes;

  NotesLoaded({required this.notes});
}

class NotesError extends NotesStates {
  final String errorMessage;

  NotesError({required this.errorMessage});
}

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());

  final DatabaseHelper db = DatabaseHelper();

  Future<void> getNotes() async {
    emit(NotesLoading());
    try {
      final notes = await db.getNotes();
      emit(NotesLoaded(notes: notes));
    } catch (e) {
      emit(NotesError(errorMessage: "Failed To load Notes"));
    }
  }

  Future<void> updateNotes(NoteModel note) async {
    emit(NotesLoading());
    try {
      await db.updateNote(note.id, note.title, note.content);
      getNotes();
    } catch (e) {
      emit(NotesError(errorMessage: "Failed To update Note"));
    }
  }

  Future<void> addNote(String title, String content) async {
    emit(NotesLoading());
    try {
      await db.addNote(title, content);
      getNotes();
    } catch (e) {
      emit(NotesError(errorMessage: "Failed To add Note"));
    }
  }
}
*/

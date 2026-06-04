import '../models/note_model.dart';

abstract class NoteRepository {
  Future<List<NoteModel>> fetchNotes();
}

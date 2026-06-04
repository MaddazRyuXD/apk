import '../../data/models/note_model.dart';
import '../../data/repositories/note_repository.dart';

class NoteUseCases {
  final NoteRepository repository;
  NoteUseCases(this.repository);
  Future<List<NoteModel>> fetchNotes() => repository.fetchNotes();
}

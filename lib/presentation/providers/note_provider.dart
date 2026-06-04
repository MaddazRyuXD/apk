
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/local_storage_service.dart';
import '../../data/models/note_model.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteModel>>(
  (ref) => NotesNotifier(),
);

final noteSearchProvider = StateProvider<String>((ref) => '');

class NotesNotifier extends StateNotifier<List<NoteModel>> {
  NotesNotifier() : super(_loadNotes());

  static List<NoteModel> _loadNotes() {
    final saved = LocalStorageService.readList(LocalStorageService.noteBox);
    if (saved.isEmpty) {
      return [
        const NoteModel(id: '1', title: 'Rencana minggu ini', content: 'Coba buat habit baru.'),
        const NoteModel(id: '2', title: 'Ide project', content: 'Bangun Habit Tracker modern.'),
      ];
    }
    return saved.map(NoteModel.fromMap).toList();
  }

  Future<void> _persist() async {
    await LocalStorageService.saveList(LocalStorageService.noteBox, state.map((note) => note.toMap()).toList());
  }

  void addNote(NoteModel note) {
    state = [note, ...state];
    _persist();
  }

  void updateNote(NoteModel note) {
    state = state.map((item) => item.id == note.id ? note : item).toList();
    _persist();
  }

  void removeNote(String id) {
    state = state.where((item) => item.id != id).toList();
    _persist();
  }
}

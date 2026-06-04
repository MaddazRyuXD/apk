
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/local_storage_service.dart';
import '../../data/models/habit_model.dart';

final habitsProvider = StateNotifierProvider<HabitsNotifier, List<HabitModel>>(
  (ref) => HabitsNotifier(),
);

class HabitsNotifier extends StateNotifier<List<HabitModel>> {
  HabitsNotifier() : super(_loadHabits());

  static List<HabitModel> _loadHabits() {
    final saved = LocalStorageService.readList(LocalStorageService.habitBox);
    if (saved.isEmpty) {
      return [
        const HabitModel(id: '1', name: 'Minum air 8 gelas', icon: '💧', colorHex: 0xFF34C759),
        const HabitModel(id: '2', name: 'Baca buku 30 menit', icon: '📚', colorHex: 0xFFFF9F0A),
      ];
    }
    return saved.map(HabitModel.fromMap).toList();
  }

  Future<void> _persist() async {
    await LocalStorageService.saveList(LocalStorageService.habitBox, state.map((habit) => habit.toMap()).toList());
  }

  void addHabit(HabitModel habit) {
    state = [habit, ...state];
    _persist();
  }

  void updateHabit(HabitModel habit) {
    state = state.map((item) => item.id == habit.id ? habit : item).toList();
    _persist();
  }

  void removeHabit(String id) {
    state = state.where((item) => item.id != id).toList();
    _persist();
  }
}

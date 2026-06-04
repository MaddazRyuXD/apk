import '../../data/models/habit_model.dart';
import '../../data/repositories/habit_repository.dart';

class HabitUseCases {
  final HabitRepository repository;
  HabitUseCases(this.repository);
  Future<List<HabitModel>> fetchHabits() => repository.fetchHabits();
}

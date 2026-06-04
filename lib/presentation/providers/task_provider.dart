
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/local_storage_service.dart';
import '../../data/models/task_model.dart';

final tasksProvider = StateNotifierProvider<TasksNotifier, List<TaskModel>>(
  (ref) => TasksNotifier(),
);

class TasksNotifier extends StateNotifier<List<TaskModel>> {
  TasksNotifier() : super(_loadTasks());

  static List<TaskModel> _loadTasks() {
    final saved = LocalStorageService.readList(LocalStorageService.taskBox);
    if (saved.isEmpty) {
      return [
        TaskModel(id: '1', title: 'Selesaikan review kode', deadline: DateTime.now().add(const Duration(days: 1)), priority: 'High'),
        TaskModel(id: '2', title: 'Buat konsep habit baru', deadline: DateTime.now().add(const Duration(days: 3)), priority: 'Medium'),
      ];
    }
    return saved.map(TaskModel.fromMap).toList();
  }

  Future<void> _persist() async {
    await LocalStorageService.saveList(LocalStorageService.taskBox, state.map((task) => task.toMap()).toList());
  }

  void addTask(TaskModel task) {
    state = [task, ...state];
    _persist();
  }

  void toggleCompletion(String id) {
    state = state
        .map((task) => task.id == id ? task.copyWith(isCompleted: !task.isCompleted) : task)
        .toList();
    _persist();
  }

  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
    _persist();
  }
}

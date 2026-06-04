import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

class TaskUseCases {
  final TaskRepository repository;
  TaskUseCases(this.repository);
  Future<List<TaskModel>> fetchTasks() => repository.fetchTasks();
}

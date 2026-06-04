import '../models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> fetchTasks();
}

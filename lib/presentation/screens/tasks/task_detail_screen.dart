
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitsxd/data/models/task_model.dart';
import '../../providers/task_provider.dart';

class TaskDetailScreen extends ConsumerWidget {
  final TaskModel task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Tugas')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(tasksProvider.notifier).toggleCompletion(task.id);
          Navigator.pop(context);
        },
        label: Text(task.isCompleted ? 'Batalkan Selesai' : 'Tandai Selesai'),
        icon: Icon(task.isCompleted ? Icons.undo : Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(task.description.isEmpty ? 'Deskripsi tugas belum ditambahkan.' : task.description),
            const SizedBox(height: 16),
            Text('Deadline: ${task.deadline.day}/${task.deadline.month}/${task.deadline.year}'),
            const SizedBox(height: 16),
            Text('Prioritas: ${task.priority}'),
            const SizedBox(height: 16),
            Text('Status: ${task.isCompleted ? 'Selesai' : 'Belum selesai'}'),
          ],
        ),
      ),
    );
  }
}

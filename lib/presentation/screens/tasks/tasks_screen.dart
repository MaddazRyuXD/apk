
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../providers/task_provider.dart';
import '../../widgets/tasks/task_tile.dart';

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key});

  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(tasksProvider);
    final filtered = tasks.where((task) {
      if (_filter == 'Completed') return task.isCompleted;
      if (_filter == 'Pending') return !task.isCompleted;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _filter,
                    items: const [
                      DropdownMenuItem(value: 'All', child: Text('Semua')),
                      DropdownMenuItem(value: 'Pending', child: Text('Belum Selesai')),
                      DropdownMenuItem(value: 'Completed', child: Text('Selesai')),
                    ],
                    onChanged: (value) {
                      if (value != null) setState(() => _filter = value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filtered.isEmpty
                  ? const Center(child: Text('Tidak ada tugas yang sesuai.'))
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final task = filtered[index];
                        return GestureDetector(
                          onTap: () => context.go('/tasks/detail', extra: task),
                          child: Slidable(
                            key: ValueKey(task.id),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (_) => ref.read(tasksProvider.notifier).toggleCompletion(task.id),
                                  backgroundColor: Colors.green,
                                  icon: Icons.check,
                                  label: task.isCompleted ? 'Undo' : 'Selesai',
                                ),
                                SlidableAction(
                                  onPressed: (_) => ref.read(tasksProvider.notifier).removeTask(task.id),
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  label: 'Hapus',
                                ),
                              ],
                            ),
                            child: TaskTile(
                              title: task.title,
                              subtitle: '${task.priority} • ${task.deadline.day}/${task.deadline.month}/${task.deadline.year}',
                              isCompleted: task.isCompleted,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/tasks/add'),
        child: const Icon(Icons.add),
      ),    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../providers/task_provider.dart';
import '../../data/models/task_model.dart';

class TaskFormScreen extends ConsumerStatefulWidget {
  const TaskFormScreen({super.key});

  @override
  ConsumerState<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends ConsumerState<TaskFormScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime _deadline = DateTime.now().add(const Duration(days: 1));
  String _priority = 'Medium';
  bool _isSaving = false;

  Future<void> _pickDeadline() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _deadline,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _deadline = picked);
    }
  }

  Future<void> _saveTask() async {
    setState(() => _isSaving = true);
    final task = TaskModel(
      id: const Uuid().v4(),
      title: titleController.text.trim().isEmpty ? 'Tugas Baru' : titleController.text.trim(),
      description: descriptionController.text.trim(),
      deadline: _deadline,
      priority: _priority,
    );
    ref.read(tasksProvider.notifier).addTask(task);
    setState(() => _isSaving = false);
    if (mounted) context.go('/tasks');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Tugas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Judul Tugas')),
            const SizedBox(height: 12),
            TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Deskripsi')),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Deadline'),
              subtitle: Text('${_deadline.day}/${_deadline.month}/${_deadline.year}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDeadline,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _priority,
              decoration: const InputDecoration(labelText: 'Prioritas'),
              items: const [
                DropdownMenuItem(value: 'High', child: Text('High')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'Low', child: Text('Low')),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _priority = value);
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isSaving ? null : _saveTask,
              child: _isSaving ? const CircularProgressIndicator() : const Text('Simpan Tugas'),
            ),
          ],
        ),
      ),
    );
  }
}

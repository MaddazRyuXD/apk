
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../providers/habit_provider.dart';
import 'package:habitsxd/data/models/habit_model.dart';

class HabitFormScreen extends ConsumerStatefulWidget {
  const HabitFormScreen({super.key});

  @override
  ConsumerState<HabitFormScreen> createState() => _HabitFormScreenState();
}

class _HabitFormScreenState extends ConsumerState<HabitFormScreen> {
  final nameController = TextEditingController();
  final iconController = TextEditingController();
  bool isSaving = false;

  Future<void> _saveHabit() async {
    setState(() => isSaving = true);
    final habit = HabitModel(
      id: const Uuid().v4(),
      name: nameController.text.trim().isEmpty ? 'Habit Baru' : nameController.text.trim(),
      icon: iconController.text.trim().isEmpty ? '⭐' : iconController.text.trim(),
      colorHex: 0xFF007AFF,
    );
    ref.read(habitsProvider.notifier).addHabit(habit);
    setState(() => isSaving = false);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Habit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nama Habit')),
            const SizedBox(height: 12),
            TextField(controller: iconController, decoration: const InputDecoration(labelText: 'Emoji Habit')),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: isSaving ? null : _saveHabit,
              child: isSaving ? const CircularProgressIndicator() : const Text('Simpan Habit'),
            ),
          ],
        ),
      ),
    );
  }
}

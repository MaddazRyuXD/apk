
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitsxd/data/models/habit_model.dart';
import '../../providers/habit_provider.dart';

class HabitDetailScreen extends ConsumerWidget {
  final HabitModel habit;

  const HabitDetailScreen({super.key, required this.habit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Habit')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(habitsProvider.notifier).removeHabit(habit.id);
          Navigator.pop(context);
        },
        icon: const Icon(Icons.delete_outline),
        label: const Text('Hapus Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Emoji habit: ${habit.icon}'),
            const SizedBox(height: 16),
            Text('Warna: #${habit.colorHex.toRadixString(16).padLeft(8, '0').toUpperCase()}'),
            const SizedBox(height: 16),
            const Text('Frekuensi: Harian'),
            const SizedBox(height: 16),
            const Text('Streak: 5 hari'),
          ],
        ),
      ),
    );
  }
}

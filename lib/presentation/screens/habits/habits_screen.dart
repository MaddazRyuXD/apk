
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/habit_provider.dart';
import '../../widgets/habits/habit_card.dart';
import '../../widgets/habits/habit_calendar_heatmap.dart';

class HabitsScreen extends ConsumerWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Habits')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Habit Heatmap', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          const HabitCalendarHeatmap(),
          const SizedBox(height: 16),
          ...habits.map((habit) => GestureDetector(
                onTap: () => context.go('/habits/detail', extra: habit),
                child: HabitCard(title: habit.name),
              )).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/habits/form'),
        child: const Icon(Icons.add),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../providers/calendar_provider.dart';
import '../../providers/habit_provider.dart';
import '../../providers/task_provider.dart';
import '../../widgets/common/app_bottom_nav.dart';
import '../../widgets/common/app_card.dart';
import '../ai/ai_chat_screen.dart';
import '../database/database_list_screen.dart';
import '../habits/habits_screen.dart';
import '../notes/notes_list_screen.dart';
import '../tasks/tasks_screen.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  void _showQuickAdd() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.note_add),
                title: const Text('Tambah Note'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/notes/editor');
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_task),
                title: const Text('Tambah Task'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/tasks/add');
                },
              ),
              ListTile(
                leading: const Icon(Icons.track_changes),
                title: const Text('Tambah Habit'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/habits/form');
                },
              ),
              ListTile(
                leading: const Icon(Icons.event),
                title: const Text('Tambah Event'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/calendar/event/add', extra: DateTime.now());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(tasksProvider);
    final habits = ref.watch(habitsProvider);
    final events = ref.watch(calendarProvider);
    final user = ref.watch(authProvider);

    final pages = <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Selamat datang, ${user.email.isEmpty ? 'User' : user.email.split('@').first}!', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Tanggal: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
            const SizedBox(height: 24),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Quick Stats', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text('Tasks total: ${tasks.length}'),
                  Text('Tasks selesai: ${tasks.where((task) => task.isCompleted).length}'),
                  Text('Habits aktif: ${habits.length}'),
                  Text('Event total: ${events.length}'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Habits hari ini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...habits.map((habit) => ListTile(
                        leading: Text(habit.icon, style: const TextStyle(fontSize: 24)),
                        title: Text(habit.name),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Event hari ini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...events.map((event) => ListTile(
                        title: Text(event.title),
                        subtitle: Text('${event.startTime.hour}:${event.startTime.minute.toString().padLeft(2, '0')}'),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      const NotesListScreen(),
      const TasksScreen(),
      const HabitsScreen(),
      const AIChatScreen(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('HabitsXD')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('HabitsXD', style: TextStyle(fontSize: 24, color: Colors.white)), decoration: BoxDecoration(color: Colors.blue)),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pop(context);
                context.go('/calendar');
              },
            ),
            ListTile(
              leading: const Icon(Icons.storage),
              title: const Text('Database'),
              onTap: () {
                Navigator.pop(context);
                context.go('/database');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                context.go('/settings');
              },
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: AppBottomNav(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showQuickAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}

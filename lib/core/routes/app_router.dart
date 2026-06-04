
import 'package:go_router/go_router.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/register_screen.dart';
import '../../presentation/screens/calendar/calendar_screen.dart';
import '../../presentation/screens/database/database_detail_screen.dart';
import '../../presentation/screens/database/database_list_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/notes/note_editor_screen.dart';
import '../../presentation/screens/notes/notes_list_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/tasks/task_detail_screen.dart';
import '../../presentation/screens/tasks/task_form_screen.dart';
import '../../presentation/screens/tasks/tasks_screen.dart';
import '../../presentation/screens/habits/habit_form_screen.dart';
import '../../presentation/screens/habits/habit_detail_screen.dart';
import '../../presentation/screens/habits/habits_screen.dart';
import '../../presentation/screens/calendar/event_detail_screen.dart';
import '../../presentation/screens/calendar/event_form_screen.dart';
import '../../presentation/screens/calendar/calendar_screen.dart';
import '../../presentation/screens/ai/ai_chat_screen.dart';
import '../../data/models/note_model.dart';
import '../../data/models/task_model.dart';
import '../../data/models/habit_model.dart';
import '../../data/models/event_model.dart';
import '../../data/models/database_model.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/notes', builder: (context, state) => const NotesListScreen()),
      GoRoute(path: '/notes/editor', builder: (context, state) => NoteEditorScreen(note: state.extra as NoteModel?)),
      GoRoute(path: '/tasks', builder: (context, state) => const TasksScreen()),
      GoRoute(path: '/tasks/add', builder: (context, state) => const TaskFormScreen()),
      GoRoute(path: '/tasks/detail', builder: (context, state) => TaskDetailScreen(task: state.extra as TaskModel)),
      GoRoute(path: '/habits', builder: (context, state) => const HabitsScreen()),
      GoRoute(path: '/habits/form', builder: (context, state) => const HabitFormScreen()),
      GoRoute(path: '/habits/detail', builder: (context, state) => HabitDetailScreen(habit: state.extra as HabitModel)),
      GoRoute(path: '/calendar', builder: (context, state) => const CalendarScreen()),
      GoRoute(path: '/calendar/event/add', builder: (context, state) => EventFormScreen(selectedDay: state.extra as DateTime?)),
      GoRoute(path: '/calendar/event/detail', builder: (context, state) => EventDetailScreen(event: state.extra as EventModel)),
      GoRoute(path: '/database', builder: (context, state) => const DatabaseListScreen()),
      GoRoute(path: '/database/detail', builder: (context, state) => DatabaseDetailScreen(database: state.extra as DatabaseModel)),
      GoRoute(path: '/ai', builder: (context, state) => const AIChatScreen()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
    ],
  );
}

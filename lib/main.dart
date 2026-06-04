
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes/app_router.dart';
import 'core/services/local_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorageService.init();
  runApp(const ProviderScope(child: HabitsXDApp()));
}

class HabitsXDApp extends ConsumerWidget {
  const HabitsXDApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'HabitsXD',
      theme: AppTheme.light().copyWith(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(ThemeData.light().textTheme),
      ),
      darkTheme: AppTheme.dark().copyWith(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(ThemeData.dark().textTheme),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}

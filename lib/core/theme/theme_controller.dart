import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/local_storage_service.dart';

final themeModeProvider = StateNotifierProvider<ThemeController, bool>(
  (ref) => ThemeController(),
);

class ThemeController extends StateNotifier<bool> {
  ThemeController() : super(LocalStorageService.readValue<bool>(LocalStorageService.settingsBox, 'darkMode') ?? false);

  void toggleTheme() {
    state = !state;
    LocalStorageService.saveValue<bool>(LocalStorageService.settingsBox, 'darkMode', state);
  }
}

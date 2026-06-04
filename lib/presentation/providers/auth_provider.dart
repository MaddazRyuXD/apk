
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/local_storage_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);

class AuthState {
  final bool isAuthenticated;
  final String email;

  const AuthState({required this.isAuthenticated, this.email = ''});

  AuthState copyWith({bool? isAuthenticated, String? email}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      email: email ?? this.email,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(_loadAuthState());

  static AuthState _loadAuthState() {
    final isAuthenticated = LocalStorageService.readValue<bool>(LocalStorageService.settingsBox, 'isAuthenticated') ?? false;
    final email = LocalStorageService.readValue<String>(LocalStorageService.settingsBox, 'email') ?? '';
    return AuthState(isAuthenticated: isAuthenticated, email: email);
  }

  Future<void> _persist() async {
    await LocalStorageService.saveValue<bool>(LocalStorageService.settingsBox, 'isAuthenticated', state.isAuthenticated);
    await LocalStorageService.saveValue<String>(LocalStorageService.settingsBox, 'email', state.email);
  }

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    state = state.copyWith(isAuthenticated: true, email: email);
    await _persist();
  }

  Future<void> register(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    state = state.copyWith(isAuthenticated: true, email: email);
    await _persist();
  }

  Future<void> logout() async {
    state = const AuthState(isAuthenticated: false);
    await _persist();
  }
}

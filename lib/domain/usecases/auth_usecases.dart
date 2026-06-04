import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

class AuthUseCases {
  final AuthRepository repository;
  AuthUseCases(this.repository);

  Future<UserModel> login(String email, String password) => repository.login(email, password);
  Future<UserModel> register(String name, String email, String password) => repository.register(name, email, password);
}

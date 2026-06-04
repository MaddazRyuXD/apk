import '../../data/models/database_model.dart';
import '../../data/repositories/database_repository.dart';

class DatabaseUseCases {
  final DatabaseRepository repository;
  DatabaseUseCases(this.repository);
  Future<List<DatabaseModel>> fetchDatabases() => repository.fetchDatabases();
}

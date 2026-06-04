import '../models/database_model.dart';

abstract class DatabaseRepository {
  Future<List<DatabaseModel>> fetchDatabases();
}


import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/database_model.dart';

final databaseProvider = Provider<List<DatabaseModel>>(
  (ref) => const [
    DatabaseModel(id: '1', name: 'Tracking Buku'),
    DatabaseModel(id: '2', name: 'Habit Journal'),
  ],
);


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/database_provider.dart';

class DatabaseListScreen extends ConsumerWidget {
  const DatabaseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databases = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Database')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: databases.length,
        itemBuilder: (context, index) {
          final database = databases[index];
          return ListTile(
            title: Text(database.name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/database/detail', extra: database),
          );
        },
      ),
    );
  }
}

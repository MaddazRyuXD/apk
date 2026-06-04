
import 'package:flutter/material.dart';
import '../../data/models/database_model.dart';

class DatabaseDetailScreen extends StatelessWidget {
  final DatabaseModel database;

  const DatabaseDetailScreen({super.key, required this.database});

  List<Map<String, String>> _sampleRows() {
    if (database.id == '1') {
      return [
        {'Judul': 'Atomic Habits', 'Penulis': 'James Clear', 'Tanggal Baca': '12 Jun 2026', 'Status': 'Selesai'},
        {'Judul': 'Deep Work', 'Penulis': 'Cal Newport', 'Tanggal Baca': '20 Jun 2026', 'Status': 'Sedang Dibaca'},
      ];
    }
    return [
      {'Judul': 'Habit Tracker Flutter', 'Penulis': 'Tim Dev', 'Tanggal Baca': '08 Mei 2026', 'Status': 'Draft'},
      {'Judul': 'Jurnal Harian', 'Penulis': 'Saya', 'Tanggal Baca': '09 Mei 2026', 'Status': 'Selesai'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final rows = _sampleRows();

    return Scaffold(
      appBar: AppBar(title: Text(database.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Database: ${database.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Kolom: Judul, Penulis, Tanggal Baca, Status'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: rows.length,
                itemBuilder: (context, index) {
                  final row = rows[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(row['Judul'] ?? ''),
                      subtitle: Text('${row['Penulis']} • ${row['Tanggal Baca']}'),
                      trailing: Text(row['Status'] ?? ''),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

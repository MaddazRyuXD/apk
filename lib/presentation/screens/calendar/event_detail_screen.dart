import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/event_model.dart';
import '../../providers/calendar_provider.dart';

class EventDetailScreen extends ConsumerWidget {
  final EventModel event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Event')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(calendarProvider.notifier).removeEvent(event.id);
          Navigator.pop(context);
        },
        icon: const Icon(Icons.delete_outline),
        label: const Text('Hapus Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Mulai: ${event.startTime.day}/${event.startTime.month}/${event.startTime.year} ${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}'),
            const SizedBox(height: 8),
            Text('Selesai: ${event.endTime.day}/${event.endTime.month}/${event.endTime.year} ${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}'),
            const SizedBox(height: 16),
            Text('Durasi: ${event.endTime.difference(event.startTime).inMinutes} menit'),
            const SizedBox(height: 16),
            Text('Warna event: #${event.colorHex.toRadixString(16).padLeft(8, '0').toUpperCase()}'),
          ],
        ),
      ),
    );
  }
}

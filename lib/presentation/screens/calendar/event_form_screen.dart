import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../providers/calendar_provider.dart';
import 'package:habitsxd/data/models/event_model.dart';

class EventFormScreen extends ConsumerStatefulWidget {
  final DateTime? selectedDay;

  const EventFormScreen({super.key, this.selectedDay});

  @override
  ConsumerState<EventFormScreen> createState() => _EventFormScreenState();
}

class _EventFormScreenState extends ConsumerState<EventFormScreen> {
  final titleController = TextEditingController();
  DateTime _startDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  Duration _duration = const Duration(hours: 1);
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final start = widget.selectedDay ?? DateTime.now();
    _startDate = DateTime(start.year, start.month, start.day);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _startDate = picked);
    }
  }

  Future<void> _pickStartTime() async {
    final picked = await showTimePicker(context: context, initialTime: _startTime);
    if (picked != null) {
      setState(() => _startTime = picked);
    }
  }

  Future<void> _saveEvent() async {
    setState(() => _isSaving = true);
    final startDateTime = DateTime(
      _startDate.year,
      _startDate.month,
      _startDate.day,
      _startTime.hour,
      _startTime.minute,
    );
    final event = EventModel(
      id: const Uuid().v4(),
      title: titleController.text.trim().isEmpty ? 'Event Baru' : titleController.text.trim(),
      startTime: startDateTime,
      endTime: startDateTime.add(_duration),
      colorHex: 0xFF5E5CE6,
    );
    ref.read(calendarProvider.notifier).addEvent(event);
    setState(() => _isSaving = false);
    if (mounted) context.go('/calendar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Judul Event')),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Tanggal Mulai'),
              subtitle: Text('${_startDate.day}/${_startDate.month}/${_startDate.year}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Waktu Mulai'),
              subtitle: Text(_startTime.format(context)),
              trailing: const Icon(Icons.access_time),
              onTap: _pickStartTime,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<Duration>(
              value: _duration,
              decoration: const InputDecoration(labelText: 'Durasi'),
              items: const [
                DropdownMenuItem(value: Duration(hours: 1), child: Text('1 jam')),
                DropdownMenuItem(value: Duration(hours: 2), child: Text('2 jam')),
                DropdownMenuItem(value: Duration(minutes: 30), child: Text('30 menit')),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _duration = value);
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isSaving ? null : _saveEvent,
              child: _isSaving ? const CircularProgressIndicator() : const Text('Simpan Event'),
            ),
          ],
        ),
      ),
    );
  }
}

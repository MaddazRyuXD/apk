
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/local_storage_service.dart';
import '../../data/models/event_model.dart';

final calendarProvider = StateNotifierProvider<CalendarNotifier, List<EventModel>>(
  (ref) => CalendarNotifier(),
);

class CalendarNotifier extends StateNotifier<List<EventModel>> {
  CalendarNotifier() : super(_loadEvents());

  static List<EventModel> _loadEvents() {
    final saved = LocalStorageService.readList(LocalStorageService.eventBox);
    if (saved.isEmpty) {
      return [
        EventModel(id: '1', title: 'Meeting tim', startTime: DateTime.now().add(const Duration(hours: 3)), endTime: DateTime.now().add(const Duration(hours: 4)), colorHex: 0xFF007AFF),
        EventModel(id: '2', title: 'Workout', startTime: DateTime.now().add(const Duration(days: 1, hours: 2)), endTime: DateTime.now().add(const Duration(days: 1, hours: 3)), colorHex: 0xFF34C759),
      ];
    }
    return saved.map(EventModel.fromMap).toList();
  }

  Future<void> _persist() async {
    await LocalStorageService.saveList(LocalStorageService.eventBox, state.map((event) => event.toMap()).toList());
  }

  void addEvent(EventModel event) {
    state = [event, ...state];
    _persist();
  }

  void removeEvent(String id) {
    state = state.where((event) => event.id != id).toList();
    _persist();
  }
}

import '../../data/models/event_model.dart';
import '../../data/repositories/calendar_repository.dart';

class CalendarUseCases {
  final CalendarRepository repository;
  CalendarUseCases(this.repository);
  Future<List<EventModel>> fetchEvents() => repository.fetchEvents();
}

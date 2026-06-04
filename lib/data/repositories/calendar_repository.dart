import '../models/event_model.dart';

abstract class CalendarRepository {
  Future<List<EventModel>> fetchEvents();
}

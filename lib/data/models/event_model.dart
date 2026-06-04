
class EventModel {
  final String id;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final int colorHex;

  const EventModel({required this.id, required this.title, required this.startTime, required this.endTime, required this.colorHex});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'colorHex': colorHex,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as String,
      title: map['title'] as String,
      startTime: DateTime.parse(map['startTime'] as String),
      endTime: DateTime.parse(map['endTime'] as String),
      colorHex: map['colorHex'] as int,
    );
  }
}

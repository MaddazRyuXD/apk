
class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  final String priority;
  final bool isCompleted;

  TaskModel({required this.id, required this.title, this.description = '', required this.deadline, this.priority = 'Low', this.isCompleted = false});

  TaskModel copyWith({String? title, String? description, DateTime? deadline, String? priority, bool? isCompleted}) {
    return TaskModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'priority': priority,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      deadline: DateTime.parse(map['deadline'] as String),
      priority: map['priority'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }
}

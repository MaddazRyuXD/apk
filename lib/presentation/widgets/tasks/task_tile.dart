
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;

  const TaskTile({super.key, required this.title, required this.subtitle, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: TextStyle(decoration: isCompleted ? TextDecoration.lineThrough : null)),
        subtitle: Text(subtitle),
        trailing: Icon(isCompleted ? Icons.check_circle : Icons.radio_button_unchecked),
      ),
    );
  }
}

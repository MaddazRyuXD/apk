import 'package:flutter/material.dart';

class TaskPriorityBadge extends StatelessWidget {
  final String label;

  const TaskPriorityBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}

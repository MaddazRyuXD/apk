
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String title;

  const EventTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}

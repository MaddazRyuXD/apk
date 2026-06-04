
import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final String title;

  const HabitCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const Icon(Icons.check_circle_outline),
          ],
        ),
      ),
    );
  }
}

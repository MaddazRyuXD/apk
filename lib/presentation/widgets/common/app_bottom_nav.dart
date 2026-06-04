
import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
        BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Tasks'),
        BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: 'Habits'),
        BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'AI'),
      ],
    );
  }
}

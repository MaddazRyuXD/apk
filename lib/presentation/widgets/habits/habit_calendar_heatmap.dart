import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HabitCalendarHeatmap extends StatelessWidget {
  const HabitCalendarHeatmap({super.key});

  Map<DateTime, int> _buildHeatmapData() {
    final now = DateTime.now();
    final result = <DateTime, int>{};
    for (var i = 0; i < 90; i++) {
      final date = DateTime(now.year, now.month, now.day).subtract(Duration(days: i));
      result[date] = (i % 5) + 1;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: DateTime.now().subtract(const Duration(days: 89)),
      endDate: DateTime.now(),
      datasets: _buildHeatmapData(),
      colorMode: ColorMode.color,
      defaultColor: Colors.grey.shade200,
      textColor: Theme.of(context).colorScheme.onBackground,
      showText: true,
      size: 24,
      scrollable: true,
    );
  }
}

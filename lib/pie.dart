import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  final List<double> percentages;

  PieChartWidget({required this.percentages});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _generateSections(percentages),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
      ),
    );
  }

  List<PieChartSectionData> _generateSections(List<double> percentages) {
    return percentages.asMap().entries.map((entry) {
      int index = entry.key;
      double percentage = entry.value;

      return PieChartSectionData(
        color: _getColor(index),
        value: percentage,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 100,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Color _getColor(int index) {
    // Define a list of colors to use for the pie chart sections
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
    ];

    // Return a color from the list based on the index
    return colors[index % colors.length];
  }
}

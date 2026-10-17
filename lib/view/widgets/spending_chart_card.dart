import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpendingChartCard extends StatefulWidget {
  final VoidCallback? onDetailsTap;
  const SpendingChartCard({super.key, this.onDetailsTap});

  @override
  State<SpendingChartCard> createState() => _SpendingChartCardState();
}

class _SpendingChartCardState extends State<SpendingChartCard> {
  final List<Map<String, dynamic>> _data = [
    {'label': 'Food', 'value': 30.0, 'color': const Color(0xFF4CAF50)},
    {'label': 'Transport', 'value': 25.0, 'color': const Color(0xFFFFA726)},
    {'label': 'Shopping', 'value': 25.0, 'color': const Color(0xFFEC407A)},
    {'label': 'Bills', 'value': 20.0, 'color': const Color(0xFF42A5F5)},
  ];

  Widget _legendItem(String label, Color color, ThemeData theme) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Monthly Spending',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: widget.onDetailsTap,
                child: Row(
                  children: [
                    Text(
                      'Details',
                      style: TextStyle(color: theme.colorScheme.primary),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sections: _data.map((item) {
                      return PieChartSectionData(
                        value: item['value'],
                        color: item['color'],
                        radius: 28,
                        showTitle: false,
                      );
                    }).toList(),
                    centerSpaceRadius: 60,
                    sectionsSpace: 3,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '৳ 3.2k',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'SPENT',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.textTheme.bodySmall?.color,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _legendItem('Food', const Color(0xFF4CAF50), theme),
                    const SizedBox(height: 12),
                    _legendItem('Shopping', const Color(0xFFEC407A), theme),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _legendItem('Transport', const Color(0xFFFFA726), theme),
                    const SizedBox(height: 12),
                    _legendItem('Bills', const Color(0xFF42A5F5), theme),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

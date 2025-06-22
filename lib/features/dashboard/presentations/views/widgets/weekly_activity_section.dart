import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/dashboard/domain/entities/chart_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyActivitySection extends StatelessWidget {
  const WeeklyActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weekly Activity',
          style: AppTextStyles.interBold16,
        ),
        const SizedBox(height: 12),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: SizedBox(
            height: 220,
            child: SfCartesianChart(
              backgroundColor: Colors.grey.shade50,
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
                ColumnSeries<ChartDataEntity, String>(
                  dataSource: [
                    ChartDataEntity('Mon', 3),
                    ChartDataEntity('Tue', 5),
                    ChartDataEntity('Wed', 2),
                    ChartDataEntity('Thu', 4),
                    ChartDataEntity('Fri', 6),
                    ChartDataEntity('Sat', 1),
                    ChartDataEntity('Sun', 3),
                  ],
                  xValueMapper: (ChartDataEntity data, _) => data.label,
                  yValueMapper: (ChartDataEntity data, _) => data.value,
                  color: Colors.indigo,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

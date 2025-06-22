import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/dashboard/domain/entities/chart_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LeadsChartSection extends StatelessWidget {
  const LeadsChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leads Overview',
          style: AppTextStyles.interBold16.copyWith(),
        ),
        const SizedBox(height: 12),
        Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: 300,
              child: SfCircularChart(
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                ),
                series: <PieSeries<ChartDataEntity, String>>[
                  PieSeries<ChartDataEntity, String>(
                    dataSource: [
                      ChartDataEntity('New', 30),
                      ChartDataEntity('In Progress', 13),
                      ChartDataEntity('Converted', 9),
                    ],
                    xValueMapper: (ChartDataEntity data, _) => data.label,
                    yValueMapper: (ChartDataEntity data, _) => data.value,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

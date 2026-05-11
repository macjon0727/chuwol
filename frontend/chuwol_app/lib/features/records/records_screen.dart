import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/secondary_card.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'RECORDS',
      currentRoute: '/records',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              MetricTile(label: 'TOTAL KM', value: '128.4'),
              SizedBox(width: 10),
              MetricTile(label: 'RUNS', value: '46'),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              MetricTile(
                label: 'LONGEST',
                value: '21D',
                accent: AppColors.goldTier,
              ),
              SizedBox(width: 10),
              MetricTile(label: 'MONTH', value: '32.8'),
            ],
          ),
          const SizedBox(height: 18),
          const SecondaryCard(child: Text('월간 스트릭 캘린더 · 18/31 완료')),
          const SizedBox(height: 12),
          for (final run in const [
            '오늘 · 2.61km · 추월 성공',
            '어제 · 3.20km · 스트릭 유지',
            '5월 9일 · 1.88km · +40P',
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SecondaryCard(child: Text(run)),
            ),
        ],
      ),
    );
  }
}

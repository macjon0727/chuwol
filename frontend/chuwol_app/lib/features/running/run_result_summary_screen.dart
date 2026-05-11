import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_card.dart';
import '../../core/widgets/status_badge.dart';

class RunResultSummaryScreen extends StatelessWidget {
  const RunResultSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'RUN RESULT',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NeonCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge(label: 'OVERTAKE SUCCESS'),
                SizedBox(height: 14),
                Text(
                  'HYUN RUNNER 추월 완료',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 8),
                Text(
                  '+120P 지급',
                  style: TextStyle(
                    color: AppColors.goldTier,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              MetricTile(label: 'DISTANCE', value: '2.61'),
              SizedBox(width: 10),
              MetricTile(label: 'TIME', value: '14:02'),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              MetricTile(label: 'PACE', value: "5'22\""),
              SizedBox(width: 10),
              MetricTile(label: 'KCAL', value: '186'),
            ],
          ),
          const SizedBox(height: 16),
          const SecondaryCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('구간별 페이스'),
                SizedBox(height: 10),
                Text('1km  5:34  |  2km  5:18  |  0.61km  5:12'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const SecondaryCard(
            child: SizedBox(
              height: 120,
              child: Center(child: Text('지도 경로 카드')),
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            label: '인스타그램에 공유하기',
            icon: Icons.ios_share_rounded,
            onPressed: () => context.go('/share'),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => context.go('/home'),
            child: const Text('홈으로 돌아가기'),
          ),
        ],
      ),
    );
  }
}

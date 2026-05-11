import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_card.dart';
import '../../core/widgets/status_badge.dart';

class TargetDetailScreen extends StatelessWidget {
  const TargetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'TARGET DETAIL',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.neonLime,
                child: Text('H'),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HYUN RUNNER',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 4),
                    StatusBadge(label: 'GOLD TIER', color: AppColors.goldTier),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              MetricTile(label: 'STREAK', value: '9D'),
              SizedBox(width: 10),
              MetricTile(label: 'GAP', value: '0.42'),
            ],
          ),
          const SizedBox(height: 16),
          const SecondaryCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('최근 기록'),
                SizedBox(height: 10),
                Text('오늘 2.4km · 어제 3.1km · 3일 전 1.8km'),
              ],
            ),
          ),
          const SizedBox(height: 22),
          PrimaryButton(
            label: '타겟 지정',
            icon: Icons.flag_rounded,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

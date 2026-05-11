import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_card.dart';
import '../../core/widgets/status_badge.dart';

class RankingTargetScreen extends StatelessWidget {
  const RankingTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'RANKING',
      currentRoute: '/ranking',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NeonCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge(label: 'GOLD TIER', color: AppColors.goldTier),
                SizedBox(height: 12),
                Text(
                  '현재 순위 42위',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 6),
                Text('이번 주 18.4km'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SecondaryCard(
            onTap: () => context.go('/target-detail'),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.neonLime,
                  child: Text('H'),
                ),
                SizedBox(width: 12),
                Expanded(child: Text('41위 HYUN RUNNER · +0.42km')),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            label: '타겟으로 지정',
            icon: Icons.my_location_rounded,
            onPressed: () => context.go('/target-detail'),
          ),
          const SizedBox(height: 20),
          for (final row in const [
            '40위  JIN SPEED  19.1km',
            '41위  HYUN RUNNER  18.82km',
            '42위  YOU  18.40km',
            '43위  MIN DASH  17.9km',
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SecondaryCard(child: Text(row)),
            ),
        ],
      ),
    );
  }
}

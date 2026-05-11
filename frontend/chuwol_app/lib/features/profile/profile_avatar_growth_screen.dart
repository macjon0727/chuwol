import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/neon_circle.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/status_badge.dart';

class ProfileAvatarGrowthScreen extends StatelessWidget {
  const ProfileAvatarGrowthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'PROFILE',
      currentRoute: '/profile',
      child: Column(
        children: [
          NeonCircle(
            size: 150,
            color: AppColors.goldTier,
            child: Text(
              'LV.2',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: AppColors.goldTier),
            ),
          ),
          const SizedBox(height: 18),
          const NeonCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge(label: 'RUNNER'),
                SizedBox(height: 12),
                Text('다음 진화: Neon Sprinter'),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: 0.64,
                  color: AppColors.neonLime,
                  backgroundColor: AppColors.border,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              MetricTile(label: 'OVERTAKES', value: '18'),
              SizedBox(width: 10),
              MetricTile(label: 'STREAK', value: '7D'),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              MetricTile(
                label: 'POINTS',
                value: '1,240P',
                accent: AppColors.goldTier,
              ),
              SizedBox(width: 10),
              MetricTile(label: 'SHIELDS', value: '1'),
            ],
          ),
          const SizedBox(height: 22),
          PrimaryButton(
            label: 'SHOP 이동',
            icon: Icons.storefront_rounded,
            onPressed: () => context.go('/shop'),
          ),
        ],
      ),
    );
  }
}

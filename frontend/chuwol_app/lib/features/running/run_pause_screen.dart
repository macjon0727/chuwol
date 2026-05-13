import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_button.dart';

class RunPauseScreen extends StatelessWidget {
  const RunPauseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'PAUSED',
      backRoute: '/running',
      child: Column(
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.pause_circle_filled_rounded,
            size: 110,
            color: AppColors.neonLime,
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              MetricTile(label: 'DISTANCE', value: '2.18'),
              SizedBox(width: 10),
              MetricTile(label: 'TIME', value: '12:04'),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              MetricTile(label: 'PACE', value: "5'20\""),
              SizedBox(width: 10),
              MetricTile(label: 'TARGET', value: '0.07'),
            ],
          ),
          const SizedBox(height: 28),
          PrimaryButton(
            label: '계속 달리기',
            icon: Icons.play_arrow_rounded,
            onPressed: () => context.go('/running'),
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: '러닝 종료',
            icon: Icons.stop_rounded,
            danger: true,
            onPressed: () => context.go('/run-result'),
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: '화면 잠금',
            icon: Icons.lock_rounded,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

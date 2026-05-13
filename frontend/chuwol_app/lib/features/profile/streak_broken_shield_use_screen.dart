import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_button.dart';

class StreakBrokenShieldUseScreen extends StatelessWidget {
  const StreakBrokenShieldUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'STREAK BROKEN',
      backRoute: '/home',
      child: Column(
        children: [
          const Icon(
            Icons.ac_unit_rounded,
            size: 120,
            color: AppColors.neonLime,
          ),
          const SizedBox(height: 18),
          Text(
            '7일 스트릭이 끊길 위기입니다.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'ICE SHIELD 사용',
            icon: Icons.shield_rounded,
            onPressed: () => context.go('/home'),
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: '다시 시작',
            danger: true,
            onPressed: () => context.go('/home'),
          ),
        ],
      ),
    );
  }
}

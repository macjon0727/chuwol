import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_card.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'SETUP RUNNER',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '오늘부터 추월을 시작합니다.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          const NeonCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NICKNAME'),
                SizedBox(height: 8),
                Text(
                  'HYUN RUNNER',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const SecondaryCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('러닝 레벨'),
                Text(
                  'BEGINNER',
                  style: TextStyle(
                    color: AppColors.neonLime,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const SecondaryCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('기본 캐릭터'),
                Text(
                  'Lv.1 EGG',
                  style: TextStyle(
                    color: AppColors.goldTier,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          PrimaryButton(
            label: '다음',
            onPressed: () => context.go('/permission'),
          ),
        ],
      ),
    );
  }
}

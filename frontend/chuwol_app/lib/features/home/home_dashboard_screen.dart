import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/chuwol_visuals.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_card.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: '',
      currentRoute: '/home',
      pattern: ChuwolBackgroundPattern.diagonal,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.card,
                  border: Border.all(color: AppColors.neonLime, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.neonLime.withValues(alpha: 0.18),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: const Text('🏃', style: TextStyle(fontSize: 22)),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '지독한러너님',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Center(
            child: Column(
              children: [
                const Text(
                  'CURRENT STREAK',
                  style: TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '42 DAYS',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.neonLime,
                    fontSize: 62,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: AppColors.neonLime.withValues(alpha: 0.45),
                        blurRadius: 22,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '오늘 1km를 뛰어 불꽃을 유지하세요!',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          NeonCard(
            onTap: () => context.go('/target-detail'),
            child: const TargetProgressGauge(
              progress: 0.75,
              gapLabel: '추월까지 1.2km',
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            '이번 주 추월 기록',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          const WeeklyCircleCalendar(),
          const SizedBox(height: 30),
          PrimaryButton(
            label: 'CHUWOL 시작하기',
            icon: Icons.bolt_rounded,
            onPressed: () => context.go('/run-ready'),
          ),
          const SizedBox(height: 14),
          SecondaryCard(
            onTap: () => context.go('/ranking'),
            child: const Row(
              children: [
                Icon(Icons.emoji_events_rounded, color: AppColors.goldTier),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Gold Tier 3위 · 플래티넘 승급까지 1명 추월',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

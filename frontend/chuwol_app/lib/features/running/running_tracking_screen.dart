import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/secondary_button.dart';

class RunningTrackingScreen extends StatelessWidget {
  const RunningTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: '',
      backRoute: '/run-ready',
      pattern: ChuwolBackgroundPattern.grid,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_rounded, color: AppColors.neonLime),
              const SizedBox(width: 6),
              const Text(
                'GPS HIGH',
                style: TextStyle(
                  color: AppColors.neonLime,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.redAlert,
                ),
              ),
              const SizedBox(width: 8),
              const Text('LIVE', style: TextStyle(fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.card.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.neonLime.withValues(alpha: 0.35),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neonLime.withValues(alpha: 0.12),
                  blurRadius: 22,
                ),
              ],
            ),
            child: const _RunningRadar(),
          ),
          const SizedBox(height: 52),
          Center(
            child: Column(
              children: [
                Text(
                  '3.24',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.whiteText,
                    fontSize: 108,
                    height: 0.88,
                    fontStyle: FontStyle.italic,
                    letterSpacing: -4,
                    shadows: const [
                      Shadow(color: Colors.black87, blurRadius: 28),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'KILOMETERS',
                  style: TextStyle(
                    color: AppColors.neonLime,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 42),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _RunSubMetric(value: '5\'30"', label: 'AVG PACE'),
              _RunSubMetric(value: '17:42', label: 'TIME'),
              _RunSubMetric(value: '210', label: 'KCAL'),
            ],
          ),
          const SizedBox(height: 54),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CircleControl(
                label: '잠금',
                icon: Icons.lock_rounded,
                onTap: () {},
              ),
              const SizedBox(width: 22),
              _PauseControl(onTap: () => context.go('/run-pause')),
              const SizedBox(width: 22),
              _CircleControl(
                label: '종료',
                icon: Icons.stop_rounded,
                danger: true,
                onTap: () => context.go('/run-result'),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SecondaryButton(
            label: '결과 화면으로 이동',
            icon: Icons.flag_rounded,
            onPressed: () => context.go('/run-result'),
          ),
        ],
      ),
    );
  }
}

class _RunningRadar extends StatelessWidget {
  const _RunningRadar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Text(
                '🔥 타겟: 민수',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              ),
            ),
            Text(
              '120m',
              style: TextStyle(
                color: AppColors.neonLime,
                fontSize: 28,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 4),
            Text('남음', style: TextStyle(color: AppColors.mutedText)),
          ],
        ),
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: 28,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 11,
                    child: Container(
                      height: 7,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 11,
                    width: constraints.maxWidth * 0.25,
                    child: Container(
                      height: 7,
                      decoration: BoxDecoration(
                        color: AppColors.redAlert,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  Positioned(
                    right: constraints.maxWidth * 0.25 - 12,
                    top: -3,
                    child: const Text('🏃', style: TextStyle(fontSize: 22)),
                  ),
                  const Positioned(
                    right: 0,
                    top: -3,
                    child: Opacity(
                      opacity: 0.48,
                      child: Text('🚶', style: TextStyle(fontSize: 22)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _RunSubMetric extends StatelessWidget {
  const _RunSubMetric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.mutedText,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _PauseControl extends StatelessWidget {
  const _PauseControl({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.neonLime,
          boxShadow: [
            BoxShadow(
              color: AppColors.neonLime.withValues(alpha: 0.42),
              blurRadius: 28,
            ),
          ],
        ),
        child: const Icon(
          Icons.pause_rounded,
          color: AppColors.black,
          size: 42,
        ),
      ),
    );
  }
}

class _CircleControl extends StatelessWidget {
  const _CircleControl({
    required this.label,
    required this.icon,
    required this.onTap,
    this.danger = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final color = danger ? AppColors.redAlert : AppColors.mutedText;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: danger
                  ? AppColors.redAlert.withValues(alpha: 0.1)
                  : AppColors.card,
              border: Border.all(
                color: danger ? AppColors.redAlert : AppColors.border,
              ),
              boxShadow: danger
                  ? [
                      BoxShadow(
                        color: AppColors.redAlert.withValues(alpha: 0.22),
                        blurRadius: 16,
                      ),
                    ]
                  : null,
            ),
            child: Icon(icon, color: color),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

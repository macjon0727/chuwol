import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/chuwol_visuals.dart';
import '../../core/widgets/primary_button.dart';

class RunResultSummaryScreen extends StatelessWidget {
  const RunResultSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: '',
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => context.go('/home'),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              const SizedBox(width: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '오늘 · 오전 06:12',
                    style: TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '아침 추월 러닝',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.neonLime.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.neonLime),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neonLime.withValues(alpha: 0.12),
                  blurRadius: 16,
                ),
              ],
            ),
            child: const Row(
              children: [
                Text('🏆', style: TextStyle(fontSize: 26)),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '민수님 추월 완료!',
                        style: TextStyle(
                          color: AppColors.neonLime,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '골드 티어 2위로 상승 · 43일 연속 유지',
                        style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const LargeMetricText(value: '3.24', label: '킬로미터', fontSize: 96),
          const SizedBox(height: 22),
          const Wrap(
            runSpacing: 20,
            spacing: 20,
            children: [
              _ResultMetric(value: '5\'28"', label: '평균 페이스'),
              _ResultMetric(value: '17:42', label: '시간'),
              _ResultMetric(value: '28 m', label: '고도 상승'),
              _ResultMetric(value: '210', label: '칼로리'),
            ],
          ),
          const SizedBox(height: 24),
          const MiniRouteMap(height: 198),
          const SizedBox(height: 26),
          const Text(
            '구간 기록',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          const _SplitRow(km: '1', pace: '5\'42"', elev: '-2 m', width: 0.75),
          const _SplitRow(
            km: '2',
            pace: '5\'15"',
            elev: '4 m',
            width: 0.60,
            fastest: true,
          ),
          const _SplitRow(km: '3', pace: '5\'30"', elev: '1 m', width: 0.70),
          const _SplitRow(
            km: '0.24',
            pace: '5\'20"',
            elev: '-1 m',
            width: 0.65,
          ),
          const SizedBox(height: 26),
          PrimaryButton(
            label: '추월 기록 인스타그램에 공유하기',
            icon: Icons.camera_alt_rounded,
            onPressed: () => context.go('/share'),
          ),
        ],
      ),
    );
  }
}

class _ResultMetric extends StatelessWidget {
  const _ResultMetric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 34,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.mutedText,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _SplitRow extends StatelessWidget {
  const _SplitRow({
    required this.km,
    required this.pace,
    required this.elev,
    required this.width,
    this.fastest = false,
  });

  final String km;
  final String pace;
  final String elev;
  final double width;
  final bool fastest;

  @override
  Widget build(BuildContext context) {
    final color = fastest ? AppColors.neonLime : const Color(0xFF222222);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 42,
            child: Text(
              km,
              style: const TextStyle(
                color: AppColors.mutedText,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: width,
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: fastest
                      ? AppColors.neonLime.withValues(alpha: 0.18)
                      : color,
                  borderRadius: BorderRadius.circular(5),
                  border: fastest
                      ? Border.all(color: AppColors.neonLime)
                      : null,
                ),
                child: Text(
                  pace,
                  style: TextStyle(
                    color: fastest ? AppColors.neonLime : AppColors.whiteText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 52,
            child: Text(
              elev,
              textAlign: TextAlign.right,
              style: const TextStyle(color: AppColors.mutedText, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

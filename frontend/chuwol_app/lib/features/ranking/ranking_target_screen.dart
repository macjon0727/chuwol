import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/primary_button.dart';

class RankingTargetScreen extends StatelessWidget {
  const RankingTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: '',
      currentRoute: '/ranking',
      pattern: ChuwolBackgroundPattern.diagonal,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
      child: Column(
        children: [
          const Center(
            child: Text(
              'LEADERBOARD',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.goldTier, Color(0xFFB8860B)],
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: AppColors.goldTier.withValues(alpha: 0.22),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Column(
              children: [
                Text('🏆', style: TextStyle(fontSize: 42)),
                SizedBox(height: 6),
                Text(
                  'GOLD TIER',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '플래티넘 승급까지 1명 추월 필요 · 2일 남음',
                  style: TextStyle(
                    color: Color(0xB3000000),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _TargetCard(onTap: () => context.go('/target-detail')),
          const SizedBox(height: 18),
          const _RankRow(
            rank: '1',
            avatar: '🦊',
            name: '달리는여우',
            distance: '184km',
            streak: '120일',
            state: '-',
            top: true,
          ),
          const _PromotionDivider(text: '플래티넘 승급 확정 (상위 2명)'),
          const _RankRow(
            rank: '2',
            avatar: '😎',
            name: '민수',
            distance: '142km',
            streak: '45일',
            state: '▼ 1',
            target: true,
          ),
          const _RankRow(
            rank: '3',
            avatar: '🏃',
            name: '지독한러너 (나)',
            distance: '140km',
            streak: '42일',
            state: '▲ 2',
            me: true,
          ),
          const _RankRow(
            rank: '4',
            avatar: '👻',
            name: '고스트러너',
            distance: '128km',
            streak: '30일',
            state: '▼ 1',
          ),
          const _PromotionDivider(text: '실버 강등 위기 (하위 1명)', danger: true),
          const _RankRow(
            rank: '5',
            avatar: '😴',
            name: '잠자는토끼',
            distance: '12km',
            streak: '0일',
            state: '▼ 2',
            faded: true,
          ),
        ],
      ),
    );
  }
}

class _TargetCard extends StatelessWidget {
  const _TargetCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.neonLime.withValues(alpha: 0.1),
          border: Border.all(color: AppColors.neonLime),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.neonLime.withValues(alpha: 0.12),
              blurRadius: 18,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '바로 앞 타겟',
              style: TextStyle(
                color: AppColors.neonLime,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '#2 민수 · 나보다 +1.2km',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            const Text(
              '오늘 1.21km 이상 달리면 추월 성공',
              style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 13),
            ),
            const SizedBox(height: 14),
            PrimaryButton(
              label: '타겟 상세 보기',
              icon: Icons.flag_rounded,
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _RankRow extends StatelessWidget {
  const _RankRow({
    required this.rank,
    required this.avatar,
    required this.name,
    required this.distance,
    required this.streak,
    required this.state,
    this.me = false,
    this.target = false,
    this.top = false,
    this.faded = false,
  });

  final String rank;
  final String avatar;
  final String name;
  final String distance;
  final String streak;
  final String state;
  final bool me;
  final bool target;
  final bool top;
  final bool faded;

  @override
  Widget build(BuildContext context) {
    final highlight = me || target;
    final borderColor = me
        ? AppColors.neonLime
        : target
        ? AppColors.goldTier.withValues(alpha: 0.55)
        : Colors.transparent;
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: highlight
            ? AppColors.neonLime.withValues(alpha: me ? 0.1 : 0.04)
            : AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Opacity(
        opacity: faded ? 0.5 : 1,
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Text(
                rank,
                style: TextStyle(
                  color: me
                      ? AppColors.neonLime
                      : top
                      ? AppColors.goldTier
                      : AppColors.mutedText,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF262626),
                border: me
                    ? Border.all(color: AppColors.neonLime, width: 2)
                    : null,
              ),
              child: Text(avatar, style: const TextStyle(fontSize: 21)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: me ? AppColors.neonLime : AppColors.whiteText,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '거리 $distance  |  불꽃 🔥 $streak',
                    style: const TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              state,
              style: TextStyle(
                color: state.startsWith('▲')
                    ? AppColors.neonLime
                    : state.startsWith('▼')
                    ? AppColors.redAlert
                    : AppColors.mutedText,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PromotionDivider extends StatelessWidget {
  const _PromotionDivider({required this.text, this.danger = false});

  final String text;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final color = danger ? AppColors.redAlert : AppColors.neonLime;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Expanded(child: Divider(color: AppColors.border)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Expanded(child: Divider(color: AppColors.border)),
        ],
      ),
    );
  }
}

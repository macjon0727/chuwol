import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/primary_button.dart';

class ProfileAvatarGrowthScreen extends StatelessWidget {
  const ProfileAvatarGrowthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: '',
      currentRoute: '/profile',
      pattern: ChuwolBackgroundPattern.diagonal,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'MY CHUWOL',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_rounded),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.card,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 28,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.neonLime.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: AppColors.neonLime.withValues(alpha: 0.5),
                    ),
                  ),
                  child: const Text(
                    'STAGE 3 · 지독한 러너',
                    style: TextStyle(
                      color: AppColors.neonLime,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                const _AuraAvatar(),
                const SizedBox(height: 18),
                const Text(
                  '지독한러너',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 18),
                const _GrowthGauge(),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    _QuickStat(value: '1,450', label: 'POINTS'),
                    SizedBox(width: 10),
                    _QuickStat(value: '43일', label: 'STREAK'),
                    SizedBox(width: 10),
                    _QuickStat(value: 'Gold II', label: 'TIER'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              const Expanded(
                child: Text(
                  '🛒 아이템 상점',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                ),
              ),
              TextButton(
                onPressed: () => context.go('/shop'),
                child: const Text('전체 보기'),
              ),
            ],
          ),
          const _ProfileShopPreview(),
          const SizedBox(height: 26),
          const Text(
            '🎖️ 최근 획득 배지',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              _BadgeCard(icon: '👟', label: '첫 추월'),
              SizedBox(width: 10),
              _BadgeCard(icon: '🔥', label: '지독한 30일'),
              SizedBox(width: 10),
              _BadgeCard(icon: '👑', label: '골드 입성'),
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: '상점으로 이동',
            icon: Icons.storefront_rounded,
            onPressed: () => context.go('/shop'),
          ),
        ],
      ),
    );
  }
}

class _AuraAvatar extends StatelessWidget {
  const _AuraAvatar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132,
      height: 132,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 132,
            height: 132,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.neonLime.withValues(alpha: 0.32),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            width: 108,
            height: 108,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF222222),
              border: Border.all(color: AppColors.neonLime, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neonLime.withValues(alpha: 0.35),
                  blurRadius: 30,
                ),
              ],
            ),
            child: const Text('🏃', style: TextStyle(fontSize: 54)),
          ),
        ],
      ),
    );
  }
}

class _GrowthGauge extends StatelessWidget {
  const _GrowthGauge();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '성장 에너지',
              style: TextStyle(
                color: AppColors.mutedText,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '75%',
              style: TextStyle(
                color: AppColors.mutedText,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: 0.75,
            minHeight: 9,
            color: AppColors.neonLime,
            backgroundColor: AppColors.border,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '🔥 3일 더 추월하면 네온 스피드스터로 진화!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.neonLime,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _QuickStat extends StatelessWidget {
  const _QuickStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: const Color(0xFF222222)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.mutedText,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileShopPreview extends StatelessWidget {
  const _ProfileShopPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neonLime.withValues(alpha: 0.35)),
      ),
      child: const Row(
        children: [
          Text('🧊', style: TextStyle(fontSize: 36)),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('스트릭 방어권', style: TextStyle(fontWeight: FontWeight.w900)),
                SizedBox(height: 4),
                Text(
                  '캐릭터가 퇴화하지 않도록 하루를 보호합니다.',
                  style: TextStyle(color: AppColors.mutedText, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            '500 P',
            style: TextStyle(
              color: AppColors.goldTier,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeCard extends StatelessWidget {
  const _BadgeCard({required this.icon, required this.label});

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.mutedText, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

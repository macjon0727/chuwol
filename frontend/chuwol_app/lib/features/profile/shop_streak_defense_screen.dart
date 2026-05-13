import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';

class ShopStreakDefenseScreen extends StatelessWidget {
  const ShopStreakDefenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: '',
      currentRoute: '/profile',
      backRoute: '/profile',
      pattern: ChuwolBackgroundPattern.diagonal,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'STREAK SHOP',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.goldTier.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.goldTier),
                ),
                child: const Text(
                  '1,450 P',
                  style: TextStyle(
                    color: AppColors.goldTier,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          _ShopItemCard(
            icon: '🧊',
            name: 'ICE SHIELD',
            subtitle: '하루 쉬어도 스트릭이 유지됩니다',
            price: '500 P',
            owned: '보유 2개',
            featured: true,
            onBuy: () => _showDummySnackBar(context, 'ICE SHIELD 구매 더미 처리'),
          ),
          const SizedBox(height: 16),
          _ShopItemCard(
            icon: '⚡',
            name: 'BOOSTER',
            subtitle: '다음 러닝 포인트 보상을 20% 증가',
            price: '900 P',
            owned: 'Challenger 해금',
            locked: true,
            onBuy: () => _showDummySnackBar(context, '아직 잠금 상태입니다'),
          ),
          const SizedBox(height: 16),
          _ShopItemCard(
            icon: '🌌',
            name: 'NEON AURA',
            subtitle: '프로필 캐릭터에 네온 아우라 적용',
            price: '1,200 P',
            owned: 'Gold II 해금',
            locked: true,
            onBuy: () => _showDummySnackBar(context, '아직 잠금 상태입니다'),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '방어권은 왜 필요할까요?',
                  style: TextStyle(
                    color: AppColors.neonLime,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '스트릭이 끊기면 성장 게이지가 멈춥니다. ICE SHIELD는 하루를 보호해 캐릭터 성장을 이어가게 해줍니다.',
                  style: TextStyle(color: Color(0xFFAAAAAA), height: 1.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDummySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ShopItemCard extends StatelessWidget {
  const _ShopItemCard({
    required this.icon,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.owned,
    required this.onBuy,
    this.featured = false,
    this.locked = false,
  });

  final String icon;
  final String name;
  final String subtitle;
  final String price;
  final String owned;
  final VoidCallback onBuy;
  final bool featured;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final borderColor = featured
        ? AppColors.neonLime.withValues(alpha: 0.55)
        : AppColors.border;
    return Opacity(
      opacity: locked ? 0.62 : 1,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1F1F1F), Color(0xFF111111)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
          boxShadow: featured
              ? [
                  BoxShadow(
                    color: AppColors.neonLime.withValues(alpha: 0.1),
                    blurRadius: 18,
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 42)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: AppColors.mutedText,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        owned,
                        style: TextStyle(
                          color: locked
                              ? AppColors.redAlert
                              : AppColors.neonLime,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: onBuy,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 86,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.neonLime.withValues(
                        alpha: locked ? 0.04 : 0.1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: locked ? AppColors.border : AppColors.neonLime,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          locked
                              ? Icons.lock_rounded
                              : Icons.shopping_bag_rounded,
                          color: locked
                              ? AppColors.mutedText
                              : AppColors.neonLime,
                          size: 18,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          locked ? '잠금' : '구매하기',
                          style: TextStyle(
                            color: locked
                                ? AppColors.mutedText
                                : AppColors.neonLime,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                price,
                style: const TextStyle(
                  color: AppColors.goldTier,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

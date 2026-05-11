import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_card.dart';
import '../../core/widgets/status_badge.dart';

class ShopStreakDefenseScreen extends StatelessWidget {
  const ShopStreakDefenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'SHOP',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NeonCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge(label: 'ICE SHIELD'),
                SizedBox(height: 12),
                Text(
                  '스트릭 방어권',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 8),
                Text(
                  '가격 500P · 보유 1개',
                  style: TextStyle(
                    color: AppColors.goldTier,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          PrimaryButton(
            label: '구매하기',
            icon: Icons.shopping_bag_rounded,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('ICE SHIELD 구매 더미 처리')),
              );
            },
          ),
          const SizedBox(height: 18),
          const SecondaryCard(
            child: Row(
              children: [
                Icon(Icons.lock_rounded, color: AppColors.mutedText),
                SizedBox(width: 12),
                Text('잠금 아이템 · COMING SOON'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_card.dart';
import '../../core/widgets/status_badge.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'PERMISSIONS',
      backRoute: '/onboarding',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '러닝 기록에 필요한 권한',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 18),
          const _PermissionRow(
            icon: Icons.gps_fixed,
            title: 'GPS 위치',
            badge: 'REQUIRED',
          ),
          const SizedBox(height: 12),
          const _PermissionRow(
            icon: Icons.favorite,
            title: '건강 데이터',
            badge: 'OPTIONAL',
          ),
          const SizedBox(height: 12),
          const _PermissionRow(
            icon: Icons.notifications,
            title: '알림',
            badge: 'OPTIONAL',
          ),
          const SizedBox(height: 28),
          PrimaryButton(
            label: '권한 허용하고 시작',
            onPressed: () => context.go('/home'),
          ),
        ],
      ),
    );
  }
}

class _PermissionRow extends StatelessWidget {
  const _PermissionRow({
    required this.icon,
    required this.title,
    required this.badge,
  });

  final IconData icon;
  final String title;
  final String badge;

  @override
  Widget build(BuildContext context) {
    return SecondaryCard(
      child: Row(
        children: [
          Icon(icon, color: AppColors.neonLime),
          const SizedBox(width: 14),
          Expanded(child: Text(title)),
          StatusBadge(label: badge),
        ],
      ),
    );
  }
}

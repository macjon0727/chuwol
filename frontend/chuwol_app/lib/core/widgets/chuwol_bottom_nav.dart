import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class ChuwolBottomNav extends StatelessWidget {
  const ChuwolBottomNav({required this.currentRoute, super.key});

  final String currentRoute;

  static const _items = [
    _NavItem('HOME', Icons.home_rounded, '/home'),
    _NavItem('RUN', Icons.directions_run_rounded, '/run-ready'),
    _NavItem('RANKING', Icons.leaderboard_rounded, '/ranking'),
    _NavItem('RECORDS', Icons.calendar_month_rounded, '/records'),
    _NavItem('PROFILE', Icons.person_rounded, '/profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final index = _items.indexWhere((item) => item.route == currentRoute);
    return NavigationBar(
      selectedIndex: index < 0 ? 0 : index,
      height: 72,
      backgroundColor: AppColors.deepDark,
      indicatorColor: AppColors.neonLime.withValues(alpha: 0.16),
      destinations: [
        for (final item in _items)
          NavigationDestination(
            icon: Icon(item.icon, color: AppColors.mutedText),
            selectedIcon: Icon(item.icon, color: AppColors.neonLime),
            label: item.label,
          ),
      ],
      onDestinationSelected: (selectedIndex) {
        final route = _items[selectedIndex].route;
        if (route != currentRoute) {
          context.go(route);
        }
      },
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.icon, this.route);

  final String label;
  final IconData icon;
  final String route;
}

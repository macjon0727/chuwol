import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class ChuwolBottomNav extends StatelessWidget {
  const ChuwolBottomNav({required this.currentRoute, super.key});

  final String currentRoute;

  static const _items = [
    _NavItem('홈', Icons.home_rounded, '/home'),
    _NavItem('러닝', Icons.directions_run_rounded, '/run-ready'),
    _NavItem('랭킹', Icons.leaderboard_rounded, '/ranking'),
    _NavItem('기록', Icons.calendar_month_rounded, '/records'),
    _NavItem('프로필', Icons.person_rounded, '/profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final index = _items.indexWhere((item) => item.route == currentRoute);
    final selectedIndex = index < 0 ? 0 : index;
    return Container(
      height: 86,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 18),
      decoration: BoxDecoration(
        color: AppColors.deepDark.withValues(alpha: 0.96),
        border: const Border(top: BorderSide(color: Color(0xFF222222))),
      ),
      child: Row(
        children: [
          for (var i = 0; i < _items.length; i++)
            Expanded(
              child: _BottomNavButton(
                item: _items[i],
                selected: selectedIndex == i,
                onTap: () {
                  final route = _items[i].route;
                  if (route != currentRoute) {
                    context.go(route);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.neonLime : AppColors.mutedText;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.neonLime.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: selected
              ? Border.all(color: AppColors.neonLime.withValues(alpha: 0.35))
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, color: color, size: 23),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: color,
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

class _NavItem {
  const _NavItem(this.label, this.icon, this.route);

  final String label;
  final IconData icon;
  final String route;
}

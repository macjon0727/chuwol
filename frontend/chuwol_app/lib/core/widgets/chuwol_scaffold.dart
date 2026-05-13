import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import 'chuwol_bottom_nav.dart';

class ChuwolScaffold extends StatelessWidget {
  const ChuwolScaffold({
    required this.title,
    required this.child,
    this.currentRoute,
    this.actions,
    this.pattern = ChuwolBackgroundPattern.none,
    this.padding = const EdgeInsets.fromLTRB(24, 18, 24, 28),
    this.backRoute,
    super.key,
  });

  final String title;
  final Widget child;
  final String? currentRoute;
  final List<Widget>? actions;
  final ChuwolBackgroundPattern pattern;
  final EdgeInsetsGeometry padding;
  final String? backRoute;

  @override
  Widget build(BuildContext context) {
    final hasInlineBackButton = title.isEmpty && backRoute != null;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: title.isEmpty
          ? null
          : AppBar(
              leading: backRoute == null
                  ? null
                  : IconButton(
                      onPressed: () => _goBack(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
              title: Text(title),
              actions: actions,
            ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.deepDark, AppColors.black],
          ),
        ),
        child: CustomPaint(
          painter: _PatternPainter(pattern),
          child: SafeArea(
            top: title.isEmpty,
            child: ListView(
              padding: padding,
              children: [
                if (hasInlineBackButton) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _InlineBackButton(onTap: () => _goBack(context)),
                  ),
                  const SizedBox(height: 18),
                ],
                child,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: currentRoute == null
          ? null
          : ChuwolBottomNav(currentRoute: currentRoute!),
    );
  }

  void _goBack(BuildContext context) {
    final route = backRoute;
    if (route != null) {
      context.go(route);
      return;
    }
    if (context.canPop()) {
      context.pop();
    }
  }
}

class _InlineBackButton extends StatelessWidget {
  const _InlineBackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: AppColors.card.withValues(alpha: 0.88),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: const Icon(Icons.arrow_back_rounded, size: 22),
      ),
    );
  }
}

enum ChuwolBackgroundPattern { none, diagonal, grid }

class _PatternPainter extends CustomPainter {
  const _PatternPainter(this.pattern);

  final ChuwolBackgroundPattern pattern;

  @override
  void paint(Canvas canvas, Size size) {
    if (pattern == ChuwolBackgroundPattern.none) {
      return;
    }

    final paint = Paint()
      ..color = AppColors.neonLime.withValues(alpha: 0.045)
      ..strokeWidth = 1;

    if (pattern == ChuwolBackgroundPattern.grid) {
      for (var x = 0.0; x < size.width; x += 40) {
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      }
      for (var y = 0.0; y < size.height; y += 40) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      }
      return;
    }

    final diagonalPaint = Paint()
      ..color = AppColors.whiteText.withValues(alpha: 0.055)
      ..strokeWidth = 1;
    for (var x = -size.height; x < size.width; x += 12) {
      canvas.drawLine(
        Offset(x, size.height),
        Offset(x + size.height, 0),
        diagonalPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _PatternPainter oldDelegate) {
    return oldDelegate.pattern != pattern;
  }
}

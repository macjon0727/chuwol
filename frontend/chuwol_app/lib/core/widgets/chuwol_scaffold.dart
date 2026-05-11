import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'chuwol_bottom_nav.dart';

class ChuwolScaffold extends StatelessWidget {
  const ChuwolScaffold({
    required this.title,
    required this.child,
    this.currentRoute,
    this.actions,
    super.key,
  });

  final String title;
  final Widget child;
  final String? currentRoute;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(title: Text(title), actions: actions),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [child],
        ),
      ),
      bottomNavigationBar: currentRoute == null
          ? null
          : ChuwolBottomNav(currentRoute: currentRoute!),
    );
  }
}

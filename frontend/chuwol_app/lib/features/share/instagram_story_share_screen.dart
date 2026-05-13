import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/status_badge.dart';

class InstagramStoryShareScreen extends StatelessWidget {
  const InstagramStoryShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'SHARE',
      backRoute: '/run-result',
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 9 / 16,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.deepDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.neonLime),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CHUWOL',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  const StatusBadge(label: 'OVERTAKE SUCCESS'),
                  const SizedBox(height: 12),
                  Text(
                    '2.61 KM',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.neonLime,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text('멈추지 않는 자가 결국 앞선다'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          PrimaryButton(
            label: '공유 완료',
            icon: Icons.check_rounded,
            onPressed: () => context.go('/home'),
          ),
        ],
      ),
    );
  }
}

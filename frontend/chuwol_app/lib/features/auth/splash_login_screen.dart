import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/neon_circle.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_button.dart';

class SplashLoginScreen extends StatelessWidget {
  const SplashLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              NeonCircle(
                size: 150,
                child: Text(
                  'CW',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.neonLime,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text('CHUWOL', style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 10),
              Text(
                '멈추지 않는 자가 결국 앞선다',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.mutedText),
              ),
              const Spacer(),
              PrimaryButton(
                label: '카카오 로그인',
                icon: Icons.chat_bubble_rounded,
                onPressed: () => context.go('/onboarding'),
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'Apple 로그인',
                icon: Icons.apple,
                onPressed: () => context.go('/onboarding'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.go('/onboarding'),
                child: const Text('게스트로 둘러보기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

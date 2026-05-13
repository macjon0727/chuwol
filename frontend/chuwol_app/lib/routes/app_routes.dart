import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/splash_login_screen.dart';
import '../features/home/home_dashboard_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/onboarding/permission_screen.dart';
import '../features/profile/profile_avatar_growth_screen.dart';
import '../features/profile/shop_streak_defense_screen.dart';
import '../features/profile/streak_broken_shield_use_screen.dart';
import '../features/ranking/add_friends_social_screen.dart';
import '../features/ranking/ranking_target_screen.dart';
import '../features/ranking/target_detail_screen.dart';
import '../features/records/records_screen.dart';
import '../features/running/run_countdown_ready_screen.dart';
import '../features/running/run_pause_screen.dart';
import '../features/running/run_result_summary_screen.dart';
import '../features/running/running_tracking_screen.dart';
import '../features/share/instagram_story_share_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const SplashLoginScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/permission',
        builder: (context, state) => const PermissionScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeDashboardScreen(),
      ),
      GoRoute(
        path: '/run-ready',
        builder: (context, state) => const RunCountdownReadyScreen(),
      ),
      GoRoute(
        path: '/running',
        builder: (context, state) => const RunningTrackingScreen(),
      ),
      GoRoute(
        path: '/run-pause',
        builder: (context, state) => const RunPauseScreen(),
      ),
      GoRoute(
        path: '/run-result',
        builder: (context, state) => const RunResultSummaryScreen(),
      ),
      GoRoute(
        path: '/ranking',
        builder: (context, state) => const RankingTargetScreen(),
      ),
      GoRoute(
        path: '/target-detail',
        builder: (context, state) => const TargetDetailScreen(),
      ),
      GoRoute(
        path: '/friends',
        builder: (context, state) => const AddFriendsSocialScreen(),
      ),
      GoRoute(
        path: '/records',
        builder: (context, state) => const RecordsScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileAvatarGrowthScreen(),
      ),
      GoRoute(
        path: '/shop',
        builder: (context, state) => const ShopStreakDefenseScreen(),
      ),
      GoRoute(
        path: '/streak-broken',
        builder: (context, state) => const StreakBrokenShieldUseScreen(),
      ),
      GoRoute(
        path: '/share',
        builder: (context, state) => const InstagramStoryShareScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Route not found: ${state.uri}'))),
  );
}

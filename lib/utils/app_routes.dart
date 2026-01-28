import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_af/screens/home/sideBar/SideMenu.dart';
import 'package:jobs_af/screens/search/search_with_category.dart';

import 'package:provider/provider.dart';

import '../Providers/introState.dart';
import '../screens/authentication/pre_login.dart';
import '../screens/home/roote/root.dart';
import '../screens/intro/intro_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/intro',
  // watch provider for changes
  redirect: (context, state) {
    final onboarding = context.read<OnboardingProvider>();

    if (onboarding.isFirstLaunch && state.matchedLocation != '/intro') {
      return '/intro';
    }
    if (!onboarding.isFirstLaunch && onboarding.isGuest) {
      // list of pages that guests are allowed to see
      final allowedForGuests = ['/home', '/search'];

      if (!allowedForGuests.contains(state.matchedLocation)) {
        return '/home'; // redirect back if not in allowed list
      }
    }

    if (!onboarding.isFirstLaunch &&
        !onboarding.isGuest &&
        state.matchedLocation == '/intro') {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/intro',
      pageBuilder: (context, state) => _buildTransitionPage(
        state,
        const OnboardingScreen(),
        const Offset(1, 0), // slide from right
      ),
    ),
    GoRoute(
      path: '/search',

      pageBuilder: (context, state) {
        final uri = Uri.parse(state.location);
        final queryParams = uri.queryParameters;
        return _buildTransitionPage(
          state,
          SearchWithCategory(
            category: queryParams['category'],
            query: queryParams['query'],
          ),
          const Offset(0, 1), // slide from right
        );
      },
    ),

    GoRoute(
      path: '/side',
      name: 'sideMenu',
      pageBuilder: (context, state) => _buildTransitionPage(
        state,
        const Sidemenu(),
        const Offset(1, 0), // slide from right
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => _buildTransitionPage(
        state,

        const LoginPage(),
        const Offset(0, 1), // slide from bottom
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => _buildTransitionPage(
        state,
        const NavigationMenu(),
        const Offset(0, 1), // slide from bottom
      ),
    ),
  ],
);

CustomTransitionPage _buildTransitionPage(
  GoRouterState state,
  Widget child,
  Offset begin,
) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(
        begin: begin,
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

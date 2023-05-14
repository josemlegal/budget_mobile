import 'package:budgetkp/presentation/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding-view',
  routes: [
    GoRoute(
      path: '/login-view',
      name: LoginView.name,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/settings-view',
      name: SettingsView.name,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: '/onboarding-view',
      name: OnboardingView.name,
      builder: (context, state) => const OnboardingView(),
    ),
  ],
);

import 'package:go_router/go_router.dart';
import 'package:taskflowapp/features/screens/on_boarding_screen.dart';
import 'package:taskflowapp/features/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnBoardingScreen(),
      )
  ],
);
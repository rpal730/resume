import 'package:go_router/go_router.dart';
import 'package:resume/screens/homepage/view/homepage.dart';
import 'package:resume/screens/login/view/login_screen.dart';
import 'package:resume/screens/splash/view/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/homepage',
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/homepage',
      name: Homepage.routeName,
      builder: (context, state) => const Homepage(),
    ),
  ],
);

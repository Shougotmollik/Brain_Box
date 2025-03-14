import 'package:brain_box/route/route_names.dart';
import 'package:brain_box/views/auth/onboarding_screen/onboarding_screen.dart';
import 'package:brain_box/views/auth/splash_screen/splash_screen.dart';
import 'package:brain_box/views/auth/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.onBoardingScreen,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: RouteNames.welcomeScreen,
      page: () => const WelcomeScreen(),
    )
  ];
}

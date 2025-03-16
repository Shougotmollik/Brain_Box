import 'package:brain_box/route/route_names.dart';
import 'package:brain_box/views/screens/auth/log_in_screen/log_in_screen.dart';
import 'package:brain_box/views/screens/auth/onboarding_screen/onboarding_screen.dart';
import 'package:brain_box/views/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:brain_box/views/screens/auth/splash_screen/splash_screen.dart';
import 'package:brain_box/views/screens/auth/welcome_screen/welcome_screen.dart';
import 'package:brain_box/views/screens/main_screen/chat_bot_screen.dart';

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
    ),
    GetPage(
      name: RouteNames.signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RouteNames.logInScreen,
      page: () => const LogInScreen(),
    ),
    GetPage(
      name: RouteNames.chatBotScreen,
      page: () => const ChatBotScreen(),
    )
  ];
}

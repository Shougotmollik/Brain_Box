import 'package:brain_box/route/route_names.dart';
import 'package:brain_box/services/state_holder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  void checkAuthState() async {
    // Check if user is logged in
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is logged in, go to home page
      Get.offAllNamed(RouteNames.chatBotScreen);
    } else {
      // User is not logged in
      // Check if first time launching app
      bool firstLaunch = await getFirstLaunchStatus();

      if (firstLaunch) {
        // First time, show onboarding
        Get.offAllNamed(RouteNames.onBoardingScreen);
      } else {
        // Not first time, go to sign up/login
        Get.offAllNamed(RouteNames.welcomeScreen);
      }
    }
  }
}

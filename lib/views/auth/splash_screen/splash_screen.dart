import 'package:brain_box/utils/constants/app_assets_path.dart';
import 'package:brain_box/utils/constants/app_strings.dart';
import 'package:brain_box/utils/ui_helper/ui_helper.dart';
import 'package:brain_box/views/auth/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(const OnboardingScreen());
      },
    );
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            customImage(
                imageSource: AppAssetsPath.appLogo, height: 120, width: 140),
            const Spacer(),
            const Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              AppStrings.appVersion,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 18)
          ],
        ),
      ),
    );
  }
}

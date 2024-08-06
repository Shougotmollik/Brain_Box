import 'dart:async';

import 'package:brain_box/constants/app_strings.dart';
import 'package:brain_box/constants/image_strings.dart';
import 'package:brain_box/views/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    Timer(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          Get.to(const OnboardingScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 120),
            Lottie.network(AppImages.splashScreen),
            const SizedBox(height: 180),
            Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}

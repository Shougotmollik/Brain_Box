import 'package:brain_box/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _contoller = OnboardingController();
    return Scaffold(
      body: PageView.builder(
        itemCount: _contoller.onboardingPages.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.network(_contoller.onboardingPages[index].image),
              Text(_contoller.onboardingPages[index].title),
              Text(_contoller.onboardingPages[index].subTitle),
            ],
          );
        },
      ),
    );
  }
}

import 'package:brain_box/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  SvgPicture.asset(AppImages.onBoardingImage1),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:brain_box/route/route_names.dart';
import 'package:brain_box/utils/constants/app_assets_path.dart';
import 'package:brain_box/utils/constants/app_strings.dart';
import 'package:brain_box/utils/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    OnboardingScreenInfo(
        title: AppStrings.onboardingTitle1,
        subTitle: AppStrings.onboardingSubTitle1,
        image: AppAssetsPath.onBoardingImage1),
    OnboardingScreenInfo(
        title: AppStrings.onboardingTitle2,
        subTitle: AppStrings.onboardingSubTitle2,
        image: AppAssetsPath.onBoardingImage2),
    OnboardingScreenInfo(
        title: AppStrings.onboardingTitle3,
        subTitle: AppStrings.onboardingSubTitle3,
        image: AppAssetsPath.onBoardingImage3),
  ];

  void _skip() {
    _pageController.animateToPage(_pages.length - 1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      _onFinish();
    }
  }

  void _onFinish() {
    Get.offNamed(RouteNames.welcomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          _currentIndex == _pages.length - 1
              ? const SizedBox.shrink()
              : Positioned(
                  top: 40,
                  right: 20,
                  child: TextButton(
                      onPressed: _skip,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ))),
          Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                height: 45,
                width: 75,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: _onNext,
                    child: Text(
                      _currentIndex == _pages.length - 1 ? 'Finish' : 'Next',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    )),
              )),
          Positioned(
              bottom: 280,
              left: 160,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: const WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black,
                    dotHeight: 12,
                    dotWidth: 12),
              ))
        ],
      ),
    );
  }
}

class OnboardingScreenInfo extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const OnboardingScreenInfo(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customImage(imageSource: image, height: 480),
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}

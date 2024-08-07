import 'package:brain_box/constants/app_strings.dart';
import 'package:brain_box/constants/image_strings.dart';
import 'package:brain_box/models/onboarding_model.dart';

class OnboardingController {
  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      AppImages.onBoardingImage1,
      AppStrings.onboardingTitle1,
      AppStrings.onboardingSubTitle1,
    ),
    OnboardingModel(
      AppImages.onBoardingImage2,
      AppStrings.onboardingTitle2,
      AppStrings.onboardingSubTitle2,
    ),
    OnboardingModel(
      AppImages.onBoardingImage3,
      AppStrings.onboardingTitle3,
      AppStrings.onboardingSubTitle3,
    )
  ];
}

import 'package:brain_box/route/route_names.dart';
import 'package:brain_box/utils/constants/app_assets_path.dart';
import 'package:brain_box/utils/constants/app_strings.dart';
import 'package:brain_box/utils/constants/colors.dart';
import 'package:brain_box/utils/ui_helper/ui_helper.dart';
import 'package:brain_box/views/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customImage(imageSource: AppAssetsPath.appLogo),
              const SizedBox(height: 28),
              const SizedBox(
                width: 300,
                child: Text(
                  'Welcome to ${AppStrings.appName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 68),
              CustomElevatedButton(
                onTap: () {
                  Get.toNamed(RouteNames.logInScreen);
                },
                bgColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                btnText: 'Log in',
              ),
              const SizedBox(height: 28),
              CustomElevatedButton(
                onTap: () {
                  Get.toNamed(RouteNames.signUpScreen);
                },
                bgColor: Colors.grey.shade300,
                textColor: Colors.black26,
                btnText: 'Sign up',
              ),
              const SizedBox(height: 48),
              const Text(
                'Continue With Accounts',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onTap: () {},
                      bgColor: Colors.red.shade100,
                      textColor: Colors.red.shade600,
                      btnText: 'GOOGLE',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomElevatedButton(
                      onTap: () {},
                      bgColor: Colors.blue.shade100,
                      textColor: Colors.blue.shade600,
                      btnText: 'FACEBOOK',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

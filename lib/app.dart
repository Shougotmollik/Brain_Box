import 'package:brain_box/controller_binder.dart';
import 'package:brain_box/route/app_routes.dart';
import 'package:brain_box/route/route_names.dart';
import 'package:brain_box/theme/theme.dart';
import 'package:brain_box/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrainBoxApp extends StatelessWidget {
  const BrainBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: lightTheme,
      initialBinding: ControllerBinder(),
      getPages: AppRoutes.pages,
      initialRoute: RouteNames.splashScreen,
    );
  }
}

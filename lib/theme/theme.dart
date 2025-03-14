import 'package:brain_box/utils/constants/colors.dart';
import 'package:flutter/material.dart';

//Light Theme Configuration Here
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    surface: AppColors.whiteColor,
    onSurface: AppColors.blackColor,
    surfaceTint: AppColors.whiteColor,
    primary: AppColors.blackColor,
    onPrimary: AppColors.whiteColor,
  ),
);

//Dark Theme Configuration Here
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    surface: AppColors.blackColor,
    onSurface: AppColors.whiteColor,
    surfaceTint: AppColors.blackColor,
    primary: AppColors.whiteColor,
    onPrimary: AppColors.blackColor,
  ),
);

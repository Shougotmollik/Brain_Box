import 'package:flutter/material.dart';

// Custom image helper function for external support
Widget customImage({
  required String imageSource,
  bool isNetwork = false,
  double? height,
  double? width,
  BoxFit boxFit = BoxFit.cover,
}) {
  if (isNetwork) {
    return Image.network(
      imageSource,
      height: height,
      width: width,
      fit: boxFit,
    );
  } else {
    return Image.asset(
      imageSource,
      height: height,
      width: width,
      fit: boxFit,
    );
  }
}

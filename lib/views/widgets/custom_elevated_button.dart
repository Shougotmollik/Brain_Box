import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onTap,
    required this.btnText,
    required this.bgColor,
    required this.textColor,
  });
  final VoidCallback onTap;
  final String btnText;
  final Color bgColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: bgColor,
          foregroundColor: textColor,
          minimumSize: const Size(340, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Text(
        btnText,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

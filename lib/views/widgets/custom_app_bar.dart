import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Padding(
            padding: EdgeInsets.all(14.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
            ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

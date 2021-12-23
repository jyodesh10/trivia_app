import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trivia_app/app/modules/home/controllers/home_controller.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/theme.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryClr,
      body: InkWell(
        onTap: () {
          HomeController().startTimer();
          Get.toNamed(Routes.HOME);
        },
        child: Center(
          child: Text(
            'TAP TO GET STARTED',
            style: headingStyle,
          ),
        ),
      ),
    );
  }
}

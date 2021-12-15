import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/theme.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryClr,
      body: Center(
        child: Text(
          'LET\'S  GET  STARTED',
          style: headingStyle,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:trivia_app/app/modules/home/controllers/home_controller.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/widgets/my_button.dart';

import '../../../../theme.dart';

class ResultsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      color: AppColor.primaryClr,
      child: Center(
        child: GetBuilder<HomeController>(
          init: Get.find<HomeController>(),
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Congratulation',
                style:
                    titleStyle.copyWith(color: Colors.white, fontSize: 40.sp),
              ),
              const SizedBox(
                height: 50,
              ),
              // Text(
              //   controller.name,
              //   style: Theme.of(context).textTheme.headline3!.copyWith(
              //         color: AppColor.primaryClr,
              //       ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'You have scored',
                style:
                    titleStyle.copyWith(color: Colors.white, fontSize: 25.sp),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '${controller.scoreResult.round()}',
                style:
                    titleStyle.copyWith(color: Colors.white, fontSize: 40.sp),
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                  onPressed: () => controller.startAgain(),
                  text: 'Start Again'),
            ],
          ),
        ),
      ),
    ));
  }
}

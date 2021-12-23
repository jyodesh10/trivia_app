import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trivia_app/app/modules/home/controllers/home_controller.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/theme.dart';

class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - (controller.sec.value / 10),
              color: Colors.blue,
              backgroundColor: Colors.white,
              strokeWidth: 4,
            ),
            Center(
                child: Text('${controller.sec.value}',
                    style: titleStyle.copyWith(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ))),
          ],
        ),
      ),
    );
  }
}

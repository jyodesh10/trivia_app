import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:trivia_app/app/modules/home/controllers/quiz_controller.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/theme.dart';
import 'package:trivia_app/widgets/progress_timer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<QuizController> {
  @override
  final QuizController controller = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        height: 800,
        decoration: BoxDecoration(color: AppColor.primaryClr),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 40.h,
            ),
            buildCountdown(),
            SizedBox(
              height: 40.h,
            ),
            buildRoundTile(),
            SizedBox(
              height: 40.h,
            ),
            buildQuestionText(),
            SizedBox(
              height: 40.h,
            ),
            Obx(() => buildOptionsTile('A')),
            buildOptionsTile('B'),
            buildOptionsTile('C'),
            buildOptionsTile('D'),
            SizedBox(
              height: 10.h,
            ),
            buildSkipButton(),
          ],
        ),
      ),
    ));
  }

  buildOptionsTile(sn) {
    return InkWell(
      onTap: () {
        // controller.isSelected();
        // print(controller.selected);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        height: 60.h,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColor.borderClr, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
            ),
            CircleAvatar(
              backgroundColor: AppColor.primaryClr2,
              radius: 25,
              child: Text(
                sn,
                style: subtitleStyle,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Center(
              child: Text(
                'Mount Everest',
                style: subtitleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildCountdown() {
    return Stack(
      children: [
        Positioned(
            top: 10.h,
            child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.CATEGORY_PAGE);
                },
                child: Icon(Icons.home_filled, color: Colors.white))),
        Center(
          child: CircleAvatar(
            backgroundColor: AppColor.borderClr,
            radius: 33,
            child:
                // ProgressTimer(),
                CircleAvatar(
              backgroundColor: AppColor.primaryClr2,
              radius: 30,
              child: Text('10', style: headingStyle),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.star,
                color: Colors.white,
                size: 15.sp,
              ),
              Text("Score : ", style: subtitleStyle.copyWith(fontSize: 12.sp)),
              Text("5", style: subtitleStyle.copyWith(fontSize: 15.sp))
            ],
          ),
        )
      ],
    );
  }

  buildRoundTile() {
    return Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: AppColor.primaryClr2, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          'Round 1',
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      ),
    );
  }

  buildQuestionText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300.w,
          child: Text(
            'Which is the highest mountain?',
            style: headingStyle.copyWith(fontSize: 18.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }

  buildSkipButton() {
    return InkWell(
      onTap: () async {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Skip',
            style: subtitleStyle,
          ),
          Icon(
            Icons.double_arrow_sharp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

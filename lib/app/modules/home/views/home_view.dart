import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:trivia_app/app/modules/home/controllers/home_controller.dart';
import 'package:trivia_app/app/modules/home/controllers/quiz_controller.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/theme.dart';
import 'package:trivia_app/widgets/my_button.dart';
import 'package:trivia_app/widgets/progress_timer.dart';
import 'package:trivia_app/widgets/question_tile.dart';

class HomeView extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryClr,
        body: SingleChildScrollView(
          child: GetBuilder<HomeController>(
            init: Get.find<HomeController>(),
            builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: AppColor.primaryClr),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  buildCountdown(context),
                  SizedBox(
                    height: 40.h,
                  ),
                  buildRoundTile(),
                  SizedBox(
                    height: 40.h,
                  ),
                  // buildQuestionText(),
                  // SizedBox(
                  //   height: 40.h,
                  // ),
                  SizedBox(
                    height: 400,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => QuestionTile(
                        questionModel: controller.questionsList[index],
                      ),
                      controller: controller.pageController,
                      itemCount: controller.questionsList.length,
                    ),
                  ),
                  // ...List.generate(
                  //     controller.questionsList.length,
                  //     (index) => QuestionCard(
                  //         questionModel: controller.questionsList[index])),
                  // // buildOptionsTile('A'),
                  // // buildOptionsTile('B'),
                  // // buildOptionsTile('C'),
                  // // buildOptionsTile('D'),
                  SizedBox(
                    height: 10.h,
                  ),
                  // buildSkipButton(),
                  MyButton(
                      onPressed: () => controller.nextQuestion(),
                      text: 'Next Question'),
                ],
              ),
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
                'as Everest',
                style: subtitleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildCountdown(context) {
    return Stack(
      children: [
        Positioned(
            top: 10.h,
            child: InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Are you sure to exit ?',
                        style: titleStyle.copyWith(
                            fontSize: 20, color: AppColor.borderClr),
                      ),
                      elevation: 5,
                      backgroundColor: AppColor.primaryClr2,
                      content: Text(
                        'All progress will be lost',
                        style: titleStyle.copyWith(
                            fontSize: 15, color: AppColor.borderClr),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text(
                            'Cancel',
                            style: titleStyle.copyWith(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.startAgain();
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: Text(
                            'Yes',
                            style: titleStyle.copyWith(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ); // Get.toNamed(Routes.LOGIN);
                },
                child: Icon(Icons.home_filled, color: Colors.white))),
        Center(
          child: CircleAvatar(
            backgroundColor: AppColor.borderClr,
            radius: 20,
            child: ProgressTimer(),
            //     CircleAvatar(
            //   backgroundColor: AppColor.primaryClr2,
            //   radius: 30,
            //   child: Text('10', style: headingStyle),
            // ),
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
              Text("${controller.scoreResult.round()}",
                  style: subtitleStyle.copyWith(fontSize: 15.sp))
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
          'Round ${controller.numberOfQuestion.round()}',
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
      onTap: () => controller.nextQuestion(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Next',
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

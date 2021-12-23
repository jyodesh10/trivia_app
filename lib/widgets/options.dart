import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trivia_app/app/modules/home/controllers/home_controller.dart';
import 'package:trivia_app/constants/colors.dart';

import '../theme.dart';

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.text,
    required this.index,
    required this.questionId,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final int index;
  final int questionId;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (controller) => InkWell(
          onTap:
              controller.checkIsQuestionAnswered(questionId) ? null : onPressed,
          child: Container(
            height: 60.sp,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 2,
                color: controller.getColor(index),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // SizedBox(
                      //   width: 20.w,
                      // ),
                      CircleAvatar(
                        backgroundColor: AppColor.primaryClr2,
                        radius: 20.r,
                        child: Text(
                          '${index + 1}.',
                          style: subtitleStyle.copyWith(fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Center(
                        child: Text(
                          text,
                          style: subtitleStyle.copyWith(fontSize: 15.sp),
                        ),
                      ),
                    ],
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //       text: '${index + 1}. ',
                  //       style: Theme.of(context).textTheme.headline6,
                  //       children: [
                  //         TextSpan(
                  //           text: text,
                  //           style: Theme.of(context).textTheme.headline6,
                  //         ),
                  //       ]),
                  // ),
                  if (controller.checkIsQuestionAnswered(questionId) &&
                      controller.selectAnswer == index)
                    Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.getColor(index),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            shape: BoxShape.circle),
                        child: Icon(
                          controller.getIcon(index),
                          color: Colors.white,
                        ))
                ],
              ),
            ),
          )),
    );
  }

  buildOptionsTile() {
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
                '${index + 1}.',
                style: subtitleStyle,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Center(
              child: Text(
                text,
                style: subtitleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

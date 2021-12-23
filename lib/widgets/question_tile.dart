import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:trivia_app/app/models/question_model.dart';
import 'package:trivia_app/app/modules/home/controllers/home_controller.dart';

import 'package:trivia_app/widgets/options.dart';

import '../theme.dart';

class QuestionTile extends StatelessWidget {
  final QuestionModel questionModel;

  const QuestionTile({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 450.sp,
          // margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionModel.question,
                  style: headingStyle.copyWith(
                      fontSize: 18.sp, color: Colors.white),
                ),
                // Text(
                //   questionModel.question,
                //   style: Theme.of(context).textTheme.headline6,
                // ),
                // buildQuestionText(),
                //const SizedBox(height: 15),
                // const Spacer(
                //   flex: 1,
                // ),
                ...List.generate(
                    questionModel.options.length,
                    (index) => Column(
                          children: [
                            Options(
                                questionId: questionModel.id,
                                text: questionModel.options[index],
                                index: index,
                                onPressed: () => Get.find<HomeController>()
                                    .checkAnswer(questionModel, index)),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        )),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          )),
    );
  }

  //   buildRoundTile() {
  //   return Container(
  //     height: 40.h,
  //     width: 100.w,
  //     decoration: BoxDecoration(
  //         color: AppColor.primaryClr2, borderRadius: BorderRadius.circular(30)),
  //     child: Center(
  //       child: Text(
  //         'Round ${controller.numberOfQuestion.round()}',
  //         style: TextStyle(color: Colors.white, fontSize: 15.sp),
  //       ),
  //     ),
  //   );
  // }
  buildQuestionText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300.w,
          child: Text(
            '${questionModel.question}?',
            style: headingStyle.copyWith(fontSize: 18.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

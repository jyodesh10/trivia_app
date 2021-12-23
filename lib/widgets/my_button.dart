import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = 300,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.sp,
        width: 150.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 2, color: AppColor.borderClr)),
        child: Center(
          child: Text(
            text,
            style: titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

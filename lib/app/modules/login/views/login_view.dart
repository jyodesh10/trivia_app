import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/auth_controller.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/constants/firebase_auth_constants.dart';
import 'package:trivia_app/theme.dart';
import 'package:trivia_app/widgets/curve_clipper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryClr,
      body: SingleChildScrollView(
        child: Container(
          // height: 800,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              buildCurveTitle(context),
              SizedBox(
                height: 40.h,
              ),
              buildLoginBody(),
            ],
          ),
        ),
      ),
    );
  }

  buildCurveTitle(context) {
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
            colors: [
              AppColor.primaryClr2,
              AppColor.borderClr,
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: 150.h,
        child: Center(
          child: Text(
            'Trivia World',
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  buildLoginBody() {
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColor.primaryClr,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40.h,
            ),
            TextFormField(
              controller: _emailController,
              style: titleStyle.copyWith(fontSize: 12.sp, color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty || value.isEmail == false) {
                  return 'Please enter Correct email';
                }
                return null;
              },
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.email_sharp, color: Colors.white, size: 20),
                  labelText: "Enter your email ",
                  labelStyle: TextStyle(color: Colors.white),
                  //hintText: "Full Name",
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColor.borderClr),
                    // borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: AppColor.borderClr),
                    borderRadius: BorderRadius.circular(0),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return ' password empty or invalid';
                }
                return null;
              },
              obscureText: true,
              style: titleStyle.copyWith(fontSize: 12.sp, color: Colors.white),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.vpn_key_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  labelText: "Enter your password",
                  labelStyle: TextStyle(color: Colors.white),

                  //hintText: "Full Name",
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColor.borderClr),
                    // borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: AppColor.borderClr),
                    borderRadius: BorderRadius.circular(0),
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white)),
                  child: Checkbox(
                    // activeColor: Colors.white,
                    value: true,
                    onChanged: null,
                    checkColor: AppColor.borderClr,
                    side: BorderSide(color: Colors.white, width: 0),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Text(
                  'Remember me',
                  style:
                      titleStyle.copyWith(fontSize: 12.sp, color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 40.h,
              width: 200.w,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    AuthController.authInstance.login(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );
                    Get.snackbar('Log in', 'Successfull');
                  } else {
                    Get.snackbar('Error', 'Email or password');
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(10),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(width: 2, color: AppColor.borderClr)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member yet?',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

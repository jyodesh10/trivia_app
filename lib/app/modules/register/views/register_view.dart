import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/colors.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryClr2,
      appBar: AppBar(
        toolbarHeight: 50.h,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryClr2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Registration',
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: const BoxDecoration(
            color: AppColor.primaryClr,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: AppColor.primaryClr2,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StylishTextFormField(
                        'Enter your email',
                        const Icon(
                          Icons.email_sharp,
                          color: Colors.white,
                          size: 20,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    StylishTextFormField(
                        'Username',
                        const Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                          size: 20,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    StylishTextFormField(
                        'Create new password',
                        const Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                          size: 20,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    StylishTextFormField(
                        'Confirm password',
                        const Icon(
                          Icons.vpn_key,
                          size: 20,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side:
                              BorderSide(width: 2, color: AppColor.borderClr)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already a member?',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget StylishTextFormField(Labels, Icon textfieldicon) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: textfieldicon,
          labelText: Labels,
          labelStyle: TextStyle(color: Colors.white),
          //hintText: "Full Name",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColor.borderClr),
            // borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColor.borderClr),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}

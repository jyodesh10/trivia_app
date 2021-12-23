import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/colors.dart';
import 'package:trivia_app/constants/firebase_auth_constants.dart';

import '../../../../theme.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
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
                      TextFormField(
                        controller: _emailController,
                        style: titleStyle.copyWith(
                            fontSize: 12.sp, color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_sharp,
                                color: Colors.white, size: 20),
                            labelText: "Enter your email ",
                            labelStyle: TextStyle(color: Colors.white),
                            //hintText: "Full Name",
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColor.borderClr),
                              // borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColor.borderClr),
                              borderRadius: BorderRadius.circular(0),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      stylishTextFormField(
                          'Username',
                          const Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                            size: 20,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        style: titleStyle.copyWith(
                            fontSize: 12.sp, color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.vpn_key_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            labelText: "Enter password",
                            labelStyle: TextStyle(color: Colors.white),

                            //hintText: "Full Name",
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColor.borderClr),
                              // borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColor.borderClr),
                              borderRadius: BorderRadius.circular(0),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      stylishTextFormField(
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
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      authController.register(_emailController.text.trim(),
                          _passwordController.text.trim());
                      Get.snackbar('Registration', 'Successfull');
                    } else {
                      Get.snackbar('Error', 'Registration');
                    }
                  },
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

  Widget stylishTextFormField(labels, Icon textfieldicon) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Empty';
        }
        return null;
      },
      style: titleStyle.copyWith(fontSize: 12.sp, color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: textfieldicon,
          labelText: labels,
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

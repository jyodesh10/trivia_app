import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: !Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white));
}

TextStyle get titleStyle {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color:
              Get.isDarkMode ? Colors.white : Color.fromRGBO(27, 39, 92, 1)));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white));
}

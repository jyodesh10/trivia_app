// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:get/get.dart';
// import 'package:trivia_app/app/models/category.dart';
// import 'package:trivia_app/app/routes/app_pages.dart';
// import 'package:trivia_app/constants/colors.dart';
// import 'package:trivia_app/theme.dart';

// import '../controllers/category_page_controller.dart';

// class CategoryPageView extends GetView<CategoryPageController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.all(20.sp),
//             //     height: double.infinity,
//             color: AppColor.primaryClr,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   leading: IconButton(
//                     onPressed: () {
//                       Get.toNamed(Routes.LOGIN);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.white,
//                     ),
//                   ),
//                   title: Text(
//                     'Trivia World',
//                     style: headingStyle,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Text(
//                   'Choose a Category you like',
//                   style: headingStyle,
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 ...List.generate(categories.length,
//                     (index) => buildCategotyTile(context, index))
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }

//   buildCategotyTile(context, index) {
//     Category category = categories[index];
//     return InkWell(
//       onTap: () {
//         Get.toNamed(Routes.HOME);
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 10.sp),
//         height: 60.h,
//         //  padding: EdgeInsets.all(20.sp),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: AppColor.borderClr, width: 2)),
//         child: Center(
//           child: ListTile(
//             contentPadding: EdgeInsets.only(left: 20.w),
//             leading: CircleAvatar(
//               radius: 20,
//               backgroundColor: AppColor.primaryClr2,
//               child: Icon(
//                 category.icon,
//                 color: Colors.white,
//                 size: 15.sp,
//               ),
//             ),
//             title: Text(
//               category.name,
//               style: headingStyle.copyWith(fontSize: 15.sp),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

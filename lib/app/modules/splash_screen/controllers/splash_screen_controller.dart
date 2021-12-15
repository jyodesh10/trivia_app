import 'package:get/get.dart';
import 'package:trivia_app/app/models/category.dart';
import 'package:trivia_app/app/modules/category_page/views/category_page_view.dart';
import 'package:trivia_app/app/modules/home/views/home_view.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
  static SplashScreenController instance = Get.find();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    navigate();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(
        () => HomeView(),
      );
    });
  }
}

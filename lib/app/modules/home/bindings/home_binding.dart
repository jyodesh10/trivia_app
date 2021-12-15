import 'package:get/get.dart';
import 'package:trivia_app/app/modules/home/controllers/quiz_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(
      () => QuizController(),
    );
  }
}

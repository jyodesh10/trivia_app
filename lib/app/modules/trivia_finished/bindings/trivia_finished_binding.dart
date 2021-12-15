import 'package:get/get.dart';

import '../controllers/trivia_finished_controller.dart';

class TriviaFinishedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TriviaFinishedController>(
      () => TriviaFinishedController(),
    );
  }
}

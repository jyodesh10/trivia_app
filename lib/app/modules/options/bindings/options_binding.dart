import 'package:get/get.dart';

import '../controllers/options_controller.dart';

class OptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionsController>(
      () => OptionsController(),
    );
  }
}

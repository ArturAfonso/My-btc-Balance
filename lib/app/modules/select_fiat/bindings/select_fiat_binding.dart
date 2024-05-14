import 'package:get/get.dart';

import '../controllers/select_fiat_controller.dart';

class SelectFiatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectFiatController>(
      () => SelectFiatController(),
    );
  }
}

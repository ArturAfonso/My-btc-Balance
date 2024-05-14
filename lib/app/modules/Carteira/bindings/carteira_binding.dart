import 'package:get/get.dart';

import '../controllers/carteira_controller.dart';

class CarteiraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarteiraController>(
      () => CarteiraController(),
    );
  }
}

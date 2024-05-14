import 'package:get/get.dart';

import '../modules/Carteira/bindings/carteira_binding.dart';
import '../modules/Carteira/views/carteira_view.dart';
import '../modules/Sign-in/bindings/sign_in_binding.dart';
import '../modules/Sign-in/views/sign_in_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/select_fiat/bindings/select_fiat_binding.dart';
import '../modules/select_fiat/views/select_fiat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.CARTEIRA,
      page: () => const CarteiraView(),
      binding: CarteiraBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_FIAT,
      page: () => const SelectFiatView(),
      binding: SelectFiatBinding(),
    ),
  ];
}

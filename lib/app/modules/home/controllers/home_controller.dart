import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxDouble carteira = 0.00889922.obs;
  TextEditingController valueController = TextEditingController();
  RxInt selectedIndex = 0.obs;
  void calculateBtc(String compra) {
    double value = double.parse(compra);
    carteira.value = value;
    print(carteira);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}

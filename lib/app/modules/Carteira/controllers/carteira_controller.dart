import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_btc_balance/app/data/models/fiat_model.dart';

class CarteiraController extends GetxController {
  TextEditingController fiatController = TextEditingController();

  RxBool searchBarPressed = false.obs;

  TextEditingController searchFiatEditingController = TextEditingController();
  final dio = Dio();

  @override
  void onInit() {
    getFiats();
    super.onInit();
  }

  getFiats() async {
    var response = await dio.get('https://blockchain.info/ticker');
    // print(response);
    var codi = jsonEncode(response.data);
    // print(codi);
    List<FiatModel> fiatModels = [];

    response.data.forEach((key, value) {
      fiatModels.add(FiatModel.fromJson(key, value));
    });
    print(fiatModels.where((element) => element.fiat == "BRL"));
  }

  Future<List<FiatModel>> getFiatList() async {
    List<FiatModel> lista = [];
    var response = await dio.get('https://blockchain.info/ticker');
    response.data.forEach((key, value) {
      lista.add(FiatModel.fromJson(key, value));
    });

    return lista;
  }
}

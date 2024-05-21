import 'dart:convert';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_btc_balance/app/data/models/fiat_model.dart';

class CarteiraController extends GetxController {
  //para coinbuton
  String? selectedImage;
  TextEditingController vaultNameController = TextEditingController();
  TextEditingController fiatController = TextEditingController();
  TextEditingController amauntFiatController = TextEditingController();
  //utilizado somente quando o usuario deseja informar btc ao inves de fiat ao criar a carteira
  TextEditingController amauntBTCController = TextEditingController();
  //TextEditingController btcAmountController = TextEditingController();

  RxDouble btcBalance = 0.00000000.obs;
  //utilizado somente quando o usuario resolve pesquisar por btc ao criar a carteira
  RxDouble fiatBalance = 0.0.obs;
  final newVaultFormkey = GlobalKey<FormState>();

  RxBool searchBarPressed = false.obs;
  RxString currencyType = "".obs;

  TextEditingController searchFiatEditingController = TextEditingController();

  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
    decimalDigits: 00,
  );
  final CurrencyTextInputFormatter formatterFiat = CurrencyTextInputFormatter(symbol: "");
  final dio = Dio();

  @override
  void onInit() {
    //isso seleciona fiat ao criar uma nova carteira
    selectedImage = 'assets/cash(1).png';
    currencyType.value = "Fiat";
    super.onInit();
  }

  Future<List<FiatModel>> getFiatList() async {
    List<FiatModel> lista = [];
    var response = await dio.get('https://blockchain.info/ticker');
    response.data.forEach((key, value) {
      lista.add(FiatModel.fromJson(key, value));
    });

    return lista;
  }

  updateBtcValue() async {
    print(currencyType.value);
    if (newVaultFormkey.currentState!.validate()) {
      String fiat = fiatController.text;
      String qtdFiat = (amauntFiatController.text == "" ? "0" : amauntFiatController.text).replaceAll(RegExp(r','), '');
      String url = "https://blockchain.info/tobtc?currency=$fiat&value=$qtdFiat";
      var response = await dio.get(url);
      var tempd = double.parse(response.data);
      btcBalance.value = tempd;
      print(response);
    } else {
      btcBalance.value = 0.0;
    }
  }

  btcToFiat() async {
    if (newVaultFormkey.currentState!.validate()) {
      String fiat = fiatController.text;
      String qtdBTC =
          (amauntFiatController.text == "" ? "0.0" : amauntFiatController.text).replaceAll(RegExp(r','), '');
      String url = "https://blockchain.info/ticker";
      var response = await dio.get(url);
      var data = response.data;
      double btcToFiatRate = data[fiat]['last']; // Pegando a taxa de câmbio atual para a moeda fiat selecionada
      double qtdBtcDouble = double.parse(qtdBTC).toPrecision(8);
      double fiatValue = qtdBtcDouble * btcToFiatRate; // Convertendo o valor de Bitcoin para fiat
      fiatBalance.value = fiatValue;
      print(response);
    } else {
      fiatBalance.value = 0.0;
    }
  }

  saveNewVault() async {}
}

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:my_btc_balance/app/data/shared/widgets/custom_appbar.dart';
import 'package:my_btc_balance/app/data/shared/widgets/custom_buttom.dart';
import 'package:my_btc_balance/app/modules/Carteira/widgets/btcbody_widget.dart';
import 'package:my_btc_balance/app/modules/Carteira/widgets/coinbutton.dart';
import 'package:my_btc_balance/app/modules/Carteira/widgets/fiatbody_widget.dart';
import 'package:my_btc_balance/app/modules/Carteira/widgets/fiatselector_field.dart';
import 'package:my_btc_balance/app/modules/Sign-in/views/sign_in_view.dart';
import 'package:validatorless/validatorless.dart';

import '../controllers/carteira_controller.dart';

class CarteiraView extends GetView<CarteiraController> {
  String selectedImage = 'Fiat';
  CarteiraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: CustomAppBar(
            color: Get.theme.canvasColor,
            title: null,
            titleWidget: const Text(
              "Add new Vault",
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
            icon: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                //color: Colors.transparent,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(() => SingleChildScrollView(
              child: controller.currencyType.value == "Fiat"
                  ? FiatBodyWidet(carteiraController: controller)
                  : BtcBodyWidet(carteiraController: controller),
            )),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomButtom(
          title: const Text("Save"),
          onPressed: () {
            print(controller.currencyType.value);
            print("Fiat ${controller.fiatController.text}");
            print("Amount ${controller.amauntFiatController.text}");
            controller.updateBtcValue();
          },
        ),
      ),
    );
  }
}

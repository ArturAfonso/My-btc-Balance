import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_btc_balance/app/modules/Carteira/controllers/carteira_controller.dart';
import 'package:my_btc_balance/app/modules/Carteira/widgets/coinbutton.dart';
import 'package:my_btc_balance/app/modules/Carteira/widgets/fiatselector_field.dart';
import 'package:my_btc_balance/app/modules/Sign-in/views/sign_in_view.dart';
import 'package:validatorless/validatorless.dart';

class FiatBodyWidet extends StatelessWidget {
  const FiatBodyWidet({
    super.key,
    required this.carteiraController,
  });

  final CarteiraController carteiraController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: carteiraController.newVaultFormkey,
      child: Column(
        children: [
          CustomTextField(
            onFieldSubmitted: (p0) {
              carteiraController.updateBtcValue();
            },
            validator: Validatorless.multiple([Validatorless.required('The field is obligatory')]),
            txtFieldcontroller: carteiraController.vaultNameController,
            hintText: "Choose a name for the wallet",
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FiatSelectorField(fiatSelectorController: carteiraController),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  onFieldSubmitted: (p0) {
                    print(carteiraController.amauntFiatController.text);
                    carteiraController.updateBtcValue();
                  },
                  keyboardType: TextInputType.number,
                  inputformatters: <TextInputFormatter>[
                    CurrencyTextInputFormatter(decimalDigits: 2, symbol: ""),
                  ],
                  txtFieldcontroller: carteiraController.amauntFiatController,
                  hintText: 'Choose your amount',
                  suffixIcon: const Icon(
                    Icons.attach_money,
                    //color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CoinButton(coinButtonController: carteiraController),
            ],
          ),
          const SizedBox(height: 30),
          Obx(() => Visibility(
                visible: carteiraController.btcBalance.value != 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.size.width / 4,
                          child: Image.asset("assets/safe-box.png"),
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_left_sharp,
                          color: Colors.green.shade400,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Obx(() => Text(
                              "BTC ${carteiraController.btcBalance.value}",
                              style: const TextStyle(color: Color.fromARGB(255, 2, 122, 8), fontSize: 25),
                            )),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

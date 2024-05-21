import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_btc_balance/app/modules/Carteira/controllers/carteira_controller.dart';
import 'package:my_btc_balance/app/modules/Sign-in/views/sign_in_view.dart';
import 'package:my_btc_balance/app/routes/app_pages.dart';
import 'package:validatorless/validatorless.dart';

class FiatSelectorField extends StatelessWidget {
  const FiatSelectorField({
    super.key,
    required this.fiatSelectorController,
  });

  final CarteiraController fiatSelectorController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Stack(
          children: [
            CustomTextField(
              validator: Validatorless.multiple([Validatorless.required('The field is obligatory')]),
              txtFieldcontroller: fiatSelectorController.fiatController,
              hintText: 'Choose your fiat',
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                //color: Colors.black,
              ),
            ),
            Obx(() => InkWell(
                  onTap: fiatSelectorController.currencyType.value == ""
                      ? null
                      : () {
                          debugPrint('select unit');
                          Get.focusScope?.unfocus();
                          Get.toNamed(Routes.SELECT_FIAT);
                        },
                  child: Container(
                    width: Get.size.width,
                    height: 60,
                    color: Colors.transparent,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

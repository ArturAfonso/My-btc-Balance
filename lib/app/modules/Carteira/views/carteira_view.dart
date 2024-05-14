import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_btc_balance/app/data/shared/widgets/custom_appbar.dart';
import 'package:my_btc_balance/app/modules/Sign-in/views/sign_in_view.dart';
import 'package:my_btc_balance/app/routes/app_pages.dart';

import '../controllers/carteira_controller.dart';

class CarteiraView extends GetView<CarteiraController> {
  const CarteiraView({Key? key}) : super(key: key);
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
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                //color: Colors.transparent,
              ),
              onPressed: () {},
            )),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                width: Get.size.width / 2,
                child: Image.asset("assets/safe-box.png"),
              ),
            ),
            Stack(
              children: [
                const CustomTextField(
                  hintText: 'Choose your fiat',
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    //color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    debugPrint('select unit');
                    Get.focusScope?.unfocus();
                    Get.toNamed(Routes.SELECT_FIAT);
                  },
                  child: Container(
                    width: Get.size.width,
                    height: 60,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

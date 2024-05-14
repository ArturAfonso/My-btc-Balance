import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_btc_balance/app/data/models/fiat_model.dart';
import 'package:my_btc_balance/app/modules/Carteira/controllers/carteira_controller.dart';

class SelectFiatView extends GetView<CarteiraController> {
  const SelectFiatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        //leadingWidth: controller.searchBarPressed.value ? 20 : 60,
        leading: Obx(() => controller.searchBarPressed.value
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Get.theme.primaryColor,
                ),
                onPressed: (() {
                  controller.searchBarPressed.value = false;
                  controller.searchFiatEditingController.clear();
                  //metodo para listar unidades
                }),
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Get.theme.primaryColor,
                ),
                onPressed: (() {
                  Get.back();
                }),
              )),
        title: SizedBox(
          width: Get.size.width,
          child: Obx(() => controller.searchBarPressed.value
              ? TextFormField(
                  onChanged: (query) {
                    //metodo para filtrar unidades
                  },
                  autofocus: true,
                  controller: controller.searchFiatEditingController,
                  cursorColor: Get.theme.primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffix: Icon(
                        Icons.search,
                        color: Get.theme.primaryColor,
                      )),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Select Fiat",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ],
                )),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Obx(() => Visibility(
                visible: !controller.searchBarPressed.value,
                child: TextButton(
                    onPressed: (() {
                      controller.searchBarPressed.value = true;
                    }),
                    child: Icon(
                      Icons.search,
                      color: Get.theme.primaryColor,
                    )),
              ))
        ],
      ),
      body: FutureBuilder(
          future: controller.getFiatList(),
          builder: ((
            context,
            snapshot,
          ) {
            if (snapshot.hasData) {
              List<FiatModel> fiat = snapshot.data!;
              return ListView.separated(
                itemCount: fiat.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller.fiatController.text = fiat[index].fiat;
                      controller.update();
                      Get.back();
                    },
                    dense: true,
                    title: Text(fiat[index].fiat),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          })),
    );
  }
}

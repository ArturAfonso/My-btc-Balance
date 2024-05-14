import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_btc_balance/app/data/shared/widgets/custom_appbar.dart';
import 'package:my_btc_balance/app/routes/app_pages.dart';

import '../../../data/shared/widgets/custom_buttom.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  List<Container> items = [
    /*  Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.0),
        )),
  */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Get.theme.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: CustomAppBar(
            appbarSize: 50,
            centerTitle: true,
            title: "Welcome [User]",
            leadingWidth: 60,
            icon: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Define a forma como círculo
                color: Get.theme.cardColor.withOpacity(0.3), // Usa a cor primária do tema do app
              ),
              child: const Icon(
                Icons.person,
                //color: Colors.transparent,
              ),
            ),
            onPressed: () {},
            actionsButtons: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))],
          )),
      body: Container(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
        ),
        child: Container(
          height: Get.size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: items.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset("assets/bitcoin-wallet.png"),
                                CustomButtom(
                                  title: const Text("Add a vault"),
                                  onPressed: () {
                                    Get.toNamed(Routes.CARTEIRA);
                                  },
                                ),
                              ],
                            ) /* Center(
                              child: Container(
                                  width: 300,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15.0),
                                  )),
                            ) */
                          : CarouselSlider(
                              items: items,
                              options: CarouselOptions(
                                //height: 200,
                                aspectRatio: 2,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: false,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                // onPageChanged: () {},
                                scrollDirection: Axis.horizontal,
                                disableCenter: false,
                                padEnds: true,
                                pageSnapping: true,
                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                              ),
                            ),
                    ),
                    /* const SizedBox(
                  height: 50,
                ),
                Obx(() => Text(controller.carteira.value.toString())),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.valueController,
                  decoration: InputDecoration(
                    hintText: 'value',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    contentPadding: const EdgeInsets.all(16.0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtom(
                  title: const Text("calcular"),
                  onPressed: () {
                    controller.calculateBtc(controller.valueController.text);
                  },
                ) */
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.white,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Mensagens',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Configurações',
              ),
            ],
          )),
    );
  }
}

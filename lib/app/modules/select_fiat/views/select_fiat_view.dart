import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_fiat_controller.dart';

class SelectFiatView extends GetView<SelectFiatController> {
  const SelectFiatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectFiatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectFiatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

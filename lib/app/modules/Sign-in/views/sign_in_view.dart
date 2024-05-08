// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_btc_balance/app/data/shared/widgets/custom_appbar.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Get.theme.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: CustomAppBar(
            title: "Sign in",
            icon: const Icon(
              Icons.arrow_back_ios_new,
              //color: Colors.transparent,
            ),
            onPressed: () {},
          )),
      body: Container(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          /* borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.grey,
          ), */
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Get.theme.primaryColor),
                        )),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Hello there, sign in to continue",
                        )),
                    const SizedBox(height: 25),
                    Container(
                      width: Get.size.width / 0.5, // Largura do círculo
                      height: Get.size.height / 5, // Altura do círculo
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Define a forma como círculo
                        color: Get.theme.cardColor.withOpacity(0.3), // Usa a cor primária do tema do app
                      ),
                      child: Icon(
                        Icons.lock_outline_rounded,
                        size: Get.size.height / 8,
                        color: Get.theme.cardColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot your password?",
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

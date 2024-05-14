// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_btc_balance/app/data/shared/widgets/custom_appbar.dart';
import 'package:my_btc_balance/app/data/shared/widgets/custom_buttom.dart';
import 'package:my_btc_balance/app/routes/app_pages.dart';

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
                      height: Get.size.height / 7, // Altura do círculo
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Define a forma como círculo
                        color: Get.theme.cardColor.withOpacity(0.3), // Usa a cor primária do tema do app
                      ),
                      child: Icon(
                        Icons.lock_outline_rounded,
                        size: Get.size.height / 12,
                        color: Get.theme.cardColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hintText: "Email",
                      suffix: Icon(
                        Icons.email,
                        color: Get.theme.primaryColor,
                      ),
                      onTap: () {},
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
                    const SizedBox(height: 20),
                    CustomButtom(
                      title: const Text("Sign in"),
                      onPressed: () {
                        Get.toNamed(Routes.HOME);
                      },
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.fingerprint_rounded),
                      iconSize: Get.size.width / 6,
                      color: Get.theme.cardColor,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?    ",
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Get.theme.primaryColor),
                          ),
                          onTap: () {},
                        ),
                      ],
                    )
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

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool? obscureText;

  final void Function()? onTap;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? preffix;
  final Widget? preffixIcon;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.obscureText,
    this.onTap,
    this.suffix,
    this.suffixIcon,
    this.preffix,
    this.preffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Get.theme.primaryColor, width: 2),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Get.theme.primaryColor),
          borderRadius: BorderRadius.circular(16.0),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        suffix: suffix,
        suffixStyle: TextStyle(
          color: Get.theme.primaryColor,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: Get.theme.primaryColor,
        prefix: preffix,
        prefixIcon: preffixIcon,
        prefixIconColor: Get.theme.primaryColor,
      ),
      onTap: onTap,
    );
  }
}

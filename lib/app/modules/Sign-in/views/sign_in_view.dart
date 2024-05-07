// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Get.theme.primaryColor,
      appBar: CustomAppbar(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Sign in',
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          /* borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.grey,
          ), */
        ),
        child: Stack(
          children: [
            Container(
              height: Get.size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({Key? key, required this.icon, this.onPressed, required this.title}) : super(key: key);
  final Icon icon;
  Function()? onPressed;
  String title;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(300.0), // Altura da AppBar
      child: SizedBox(
        height: 500,
        child: AppBar(
          leadingWidth: 30,
          backgroundColor: Get.theme.primaryColor,
          elevation: 0, // Desativar a sombra da AppBar
          leading: IconButton(
            icon: icon, // Ícone de voltar
            onPressed: onPressed,
          ),

          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

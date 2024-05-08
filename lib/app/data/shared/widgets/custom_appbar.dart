// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  void Function()? onPressed;
  Widget? icon;
  CustomAppBar({
    Key? key,
    required this.title,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        AppBar(
          leadingWidth: 30,
          backgroundColor: Get.theme.primaryColor,
          elevation: 0, // Desativar a sombra da AppBar
          leading: icon != null
              ? IconButton(
                  icon: icon!, // Ícone de voltar
                  onPressed: onPressed,
                )
              : null,

          title: Text(
            title,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}

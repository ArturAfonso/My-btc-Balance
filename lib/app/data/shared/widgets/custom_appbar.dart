// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  void Function()? onPressed;
  Widget? icon;
  final bool? centerTitle;
  final List<Widget>? actionsButtons;
  final double? leadingWidth;
  final double? appbarSize;
  final Color? color;
  CustomAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.onPressed,
    this.icon,
    this.centerTitle,
    this.actionsButtons,
    this.leadingWidth,
    this.appbarSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: appbarSize ?? 40),
        AppBar(
          centerTitle: centerTitle ?? false,
          leadingWidth: leadingWidth ?? 30,
          backgroundColor: color ?? Get.theme.primaryColor,
          elevation: 0, // Desativar a sombra da AppBar
          leading: icon != null
              ? (icon == Icon
                  ? IconButton(
                      icon: icon!, // Ícone de voltar
                      onPressed: onPressed,
                    )
                  : icon)
              : null,

          title: titleWidget ??
              Text(
                title ?? "title app bar",
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
          actions: actionsButtons ?? [],
        ),
      ],
    );
  }
}

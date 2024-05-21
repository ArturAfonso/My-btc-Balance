import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_btc_balance/app/modules/Carteira/controllers/carteira_controller.dart';

class CoinButton extends StatefulWidget {
  const CoinButton({
    super.key,
    required this.coinButtonController,
  });

  @override
  _CoinButtonState createState() => _CoinButtonState();
  final CarteiraController coinButtonController;
}

class _CoinButtonState extends State<CoinButton> {
  final List<Map<String, String>> imageItems = [
    {
      'label': 'Fiat',
      'path': 'assets/cash(1).png',
    },
    {
      'label': 'BTC',
      'path': 'assets/bitcoin.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text('Select currency'),
          value: widget.coinButtonController.selectedImage,
          items: imageItems.map((item) {
            return DropdownMenuItem<String>(
              value: item['path'],
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Image.asset(
                    item['path']!,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(item['label']!),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.coinButtonController.selectedImage = value;
              var valueSelected = imageItems.where((item) => item['path'] == value);
              var tempdata = valueSelected.first;
              if (tempdata["label"] == "BTC") {
                widget.coinButtonController.amauntFiatController.clear();
                widget.coinButtonController.amauntBTCController.clear();

                widget.coinButtonController.btcBalance.value = 0.0;
                widget.coinButtonController.fiatBalance.value = 0.0;
              } else {
                widget.coinButtonController.amauntFiatController.clear();
                widget.coinButtonController.amauntBTCController.clear();
                widget.coinButtonController.btcBalance.value = 0.0;
                widget.coinButtonController.fiatBalance.value = 0.0;
              }

              widget.coinButtonController.currencyType.value = tempdata["label"]!;
            });
          },
        ),
      ),
    );
  }
}

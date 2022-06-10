import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/screens/detail_page/text_row_wodget.dart';

class OwnerCardWidget extends StatelessWidget {
  final String previousOwner;
  final String price;
  const OwnerCardWidget({Key? key, required this.previousOwner, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text("Previous Owner:"),
                  Text(previousOwner, style: const TextStyle(color: Colors.white54),)
                ],
              ),
              const SizedBox(
                height: 75,
                width: 75,
                child: Placeholder()
              )
            ],
          ),
          TextRowWidget(title: "Total Amount", value: "$price ETH")
        ],
      ),
    );
  }
}

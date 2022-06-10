import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nft_marketplace_integration/widgets/button_widget.dart';
import 'package:nft_marketplace_integration/widgets/image_card_widget.dart';

class DetailPage extends HookWidget {
  final NFTCardModel nft;
  const DetailPage({Key? key, required this.nft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 700),
    );

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageCardWidget(
            imageLink: nft.imageLink,
            controller: imageAnimationController
          ),
          ButtonWidget(
            text: "CLICK",
            onTap: () {
              imageAnimationController.forward();
            }
          )
        ],
      ),
    );
  }
}

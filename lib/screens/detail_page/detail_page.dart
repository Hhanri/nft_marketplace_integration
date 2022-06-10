import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nft_marketplace_integration/screens/detail_page/detail_footer_widget.dart';
import 'package:nft_marketplace_integration/widgets/button_widget.dart';
import 'package:nft_marketplace_integration/screens/detail_page/image_card_widget.dart';

class DetailPage extends HookWidget {
  final NFTCardModel nft;
  const DetailPage({Key? key, required this.nft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final firstFooterOpacityAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 700)
    );

    Future.delayed(const Duration(milliseconds: 700)).then((value) => firstFooterOpacityAnimationController.forward());
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.passthrough,
        children: [
          ImageCardWidget(
            imageLink: nft.imageLink,
            controller: imageAnimationController
          ),
          DetailFooterWidget(
            opacityController: firstFooterOpacityAnimationController,
            imageAnimationController: imageAnimationController,
            nftCardModel: nft
          ),
        ],
      ),
    );
  }
}

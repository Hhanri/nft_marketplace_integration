import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:nft_marketplace_integration/screens/detail_page/text_row_wodget.dart';
import 'package:nft_marketplace_integration/screens/detail_page/owner_card_widget.dart';
import 'package:nft_marketplace_integration/widgets/button_widget.dart';
import 'package:nft_marketplace_integration/widgets/footer_container_widget.dart';

class DetailFooterWidget extends StatelessWidget {
  final NFTCardModel nftCardModel;
  final AnimationController opacityController;
  final AnimationController imageAnimationController;
  const DetailFooterWidget({Key? key, required this.opacityController, required this.nftCardModel, required this.imageAnimationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(opacityController);
    //return FooterStep1(opacityController: opacityController, opacityAnimation: opacityAnimation, nftCardModel: nftCardModel, imageAnimationController: imageAnimationController);
    return FooterStep2(opacityController: opacityController, opacityAnimation: opacityAnimation, nftCardModel: nftCardModel);
  }
}

class FooterStep1 extends StatelessWidget {
  const FooterStep1({
    Key? key,
    required this.opacityController,
    required this.opacityAnimation,
    required this.nftCardModel,
    required this.imageAnimationController,
  }) : super(key: key);

  final AnimationController opacityController;
  final Animation<double> opacityAnimation;
  final NFTCardModel nftCardModel;
  final AnimationController imageAnimationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: FooterContainerWidget(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("${nftCardModel.collection} # ${nftCardModel.serialNumber}")
                  ],
                ),
                Row(
                  children: [
                    Text("owned by ${nftCardModel.owner}")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text("Remaining Time"),
                        Text("2:01:45")
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Price"),
                        Text(nftCardModel.price.toString())
                      ],
                    )
                  ],
                ),

                ButtonWidget(
                  text: "CLICK",
                  onTap: () {
                    imageAnimationController.forward();
                  }
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class FooterStep2 extends StatelessWidget {
  const FooterStep2({
    Key? key,
    required this.opacityController,
    required this.opacityAnimation,
    required this.nftCardModel,
  }) : super(key: key);

  final AnimationController opacityController;
  final Animation<double> opacityAnimation;
  final NFTCardModel nftCardModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: FooterContainerWidget(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 7,
                  child: OwnerCardWidget(previousOwner: nftCardModel.owner, price: nftCardModel.price.toString(),),
                ),
                const Spacer(),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextRowWidget(title: "Fiat amount", value: "${nftCardModel.price * 3000} USD"),
                      const TextRowWidget(title: "order n.", value: "455456"),
                      const TextRowWidget(title: "Network", value: "Ethereum"),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.wallet),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.currency_exchange),
                        )
                      ],
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.keyboard_arrow_right_outlined),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
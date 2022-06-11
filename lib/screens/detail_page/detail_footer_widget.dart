import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:nft_marketplace_integration/screens/detail_page/text_row_widget.dart';
import 'package:nft_marketplace_integration/screens/detail_page/owner_card_widget.dart';
import 'package:nft_marketplace_integration/widgets/button_widget.dart';
import 'package:nft_marketplace_integration/widgets/footer_container_widget.dart';
import 'package:nft_marketplace_integration/widgets/show_up_animation_widget.dart';

class DetailFooterWidget extends StatelessWidget {
  final NFTCardModel nftCardModel;
  final AnimationController controller;
  final VoidCallback onPay;
  final CrossFadeState crossFadeState;
  const DetailFooterWidget({Key? key, required this.controller, required this.nftCardModel, required this.onPay, required this.crossFadeState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FooterContainerWidget(
      height: crossFadeState == CrossFadeState.showFirst
        ? MediaQuery.of(context).size.height * 0.5
        : MediaQuery.of(context).size.height * 0.65
      ,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 1700),
        firstChild: FooterStep1(
          controller: controller,
          nftCardModel: nftCardModel,
          onPay: onPay,
        ),
        secondChild: FooterStep2(controller: controller, nftCardModel: nftCardModel),
        firstCurve: Curves.easeInCirc,
        secondCurve: Curves.easeOutCirc,
        crossFadeState: crossFadeState,
      ),
    );
  }
}

class FooterStep1 extends StatelessWidget {
  final AnimationController controller;
  final NFTCardModel nftCardModel;
  final VoidCallback onPay;
  const FooterStep1({
    Key? key,
    required this.controller,
    required this.nftCardModel,
    required this.onPay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimationWidget(
      controller: controller,
      child: FooterContainerWidget(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${nftCardModel.collection} # ${nftCardModel.serialNumber}"),
              Text("owned by ${nftCardModel.owner}"),
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
                onTap: onPay,
                fullWidth: true,
              ),
            ],
          ),
        ),
      )
    );
  }
}

class FooterStep2 extends StatelessWidget {
  final AnimationController controller;
  final NFTCardModel nftCardModel;
  const FooterStep2({
    Key? key,
    required this.controller,
    required this.nftCardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FooterContainerWidget(
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
    );
  }
}
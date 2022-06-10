import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/helpers/router.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';

class MiniImageCardWidget extends StatelessWidget {
  final NFTCardModel nft;
  const MiniImageCardWidget({Key? key, required this.nft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: nft.imageLink,
      child: GestureDetector(
        onTap: () {
          AppRouter.navigateToDetail(context: context, route: AppRouter.detailRoute, nftCardModel: nft);
        },
        child: Image.asset(nft.imageLink, fit: BoxFit.cover)
      )
    );
  }
}

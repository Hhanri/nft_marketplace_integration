import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';

class ListViewWidget extends StatelessWidget {
  final List<NFTCardModel> nfts;
  const ListViewWidget({Key? key, required this.nfts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int length = nfts.length;
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: nfts.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 100,
            child: Image.asset(nfts[index % length].imageLink),
          );
        },
      ),
    );
  }
}
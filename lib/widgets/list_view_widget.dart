import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/helpers/round_number.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:nft_marketplace_integration/widgets/mini_image_card_widget.dart';

class ListViewWidget extends StatelessWidget {
  final List<NFTCardModel> nfts;
  const ListViewWidget({Key? key, required this.nfts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int scrollSpeed = roundNumber(Random().nextInt(1000) + 1000);
    print(scrollSpeed);
    final int length = nfts.length;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 100,
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: nfts.length,
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: scrollSpeed),
          autoPlayInterval: Duration(milliseconds: scrollSpeed),
          autoPlayCurve: Curves.linear,
          scrollPhysics: const BouncingScrollPhysics(),
          viewportFraction: 0.25,
          disableCenter: true,
          height: 100,
          pageSnapping: false
        ),
        itemBuilder: (BuildContext context, int index, int pageIndex) {
          return MiniImageCardWidget(nft: nfts[index % length]);
        },
      ),
    );
  }
}
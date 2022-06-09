import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:nft_marketplace_integration/widgets/list_view_widget.dart';

class TiltedListViewWidget extends StatelessWidget {
  const TiltedListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.13,
      child: Transform.rotate(
        origin: const Offset(150, -110),
        angle: -45/360,
        child: FutureBuilder<List<NFTCardModel>>(
          future: NFTCardModel.getMockData(),
          builder: (BuildContext context, AsyncSnapshot<List<NFTCardModel>> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Column(
                children: [
                  for (int i = 1; i < 5; i++)
                    ListViewWidget(
                      key: UniqueKey(),
                      nfts: snapshot.data!.sublist((i-1)*8, i*8)
                    )
                ],
              );
            }
            return const SizedBox(
              height: 400,
              width: double.maxFinite,
            );
          },
        ),
      ),
    );
  }
}

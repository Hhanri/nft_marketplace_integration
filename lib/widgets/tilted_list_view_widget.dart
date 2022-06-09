import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:nft_marketplace_integration/widgets/list_view_widget.dart';

class TiltedListViewWidget extends StatelessWidget {
  const TiltedListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Transform.scale(
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
        ),
        Container(
          height: MediaQuery.of(context).size.height - 420,
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent.withOpacity(0.9),
                blurRadius: 60,
                spreadRadius: 70
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("TITLE", style: Theme.of(context).textTheme.headline4),
              Text("okjwqe oirewio kdsjkl ioeruwioe kldsjfklsdfoi  ioui eiouweio joapf oieure ieur kdj owepas[ pdpoipwop oeropd poidf", style: Theme.of(context).textTheme.bodyText2),
              ElevatedButton(
                onPressed: () {},
                child: Text("DISCOVER")
              )
            ],
          )
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/widgets/button_widget.dart';
import 'package:nft_marketplace_integration/widgets/footer_container_widget.dart';
import 'package:nft_marketplace_integration/widgets/tilted_list_view_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const TiltedListViewWidget(),
        FooterContainerWidget(
          height: MediaQuery.of(context).size.height - 420,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("TITLE", style: Theme.of(context).textTheme.headline4),
              Text("okjwqe oirewio kdsjkl ioeruwioe kldsjfklsdfoi  ioui eiouweio joapf oieure ieur kdj owepas[ pdpoipwop oeropd poidf", style: Theme.of(context).textTheme.bodyText2),
              ButtonWidget(text: "DISCOVER", onTap: () {})
            ],
          ),
        )
      ],
    );
  }
}
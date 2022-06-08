import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart' show NFTCardModel;
import 'package:nft_marketplace_integration/widgets/list_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<NFTCardModel>>(
          future: NFTCardModel.getMockData(),
          builder: (BuildContext context, AsyncSnapshot<List<NFTCardModel>> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Column(
                children: [
                  for (int i = 1; i < 5; i++)
                    Expanded(child: ListViewWidget(nfts: snapshot.data!.sublist((i-1)*8, i*8)))
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart' show NFTCardModel;
import 'package:nft_marketplace_integration/widgets/list_view_widget.dart';
import 'package:nft_marketplace_integration/widgets/tilted_list_view_widget.dart';

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
        scaffoldBackgroundColor: Colors.purpleAccent
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TiltedListViewWidget(),
    );
  }
}


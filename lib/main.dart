import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/helpers/theme.dart';
import 'package:nft_marketplace_integration/helpers/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Marketplace',
      theme: getTheme(context),
      onGenerateRoute: AppRouter().onGenerate,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/models/nf_card_model.dart';
import 'package:nft_marketplace_integration/screens/detail_page/detail_page.dart';
import 'package:nft_marketplace_integration/screens/email_confirmation_page/email_confirmation_page.dart';
import 'package:nft_marketplace_integration/screens/home_page.dart';

class AppRouter {
  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute : return returnPage(const HomePage());
      case detailRoute : return returnPage(DetailPage(nft: settings.arguments as NFTCardModel));
      case emailConfirmedRoute : return returnPage(const EmailConfirmationPage());
      default : return returnPage(const HomePage());
    }
  }

  static const String homeRoute = "/home";
  static const String detailRoute = "/detail";
  static const String emailConfirmedRoute = "/orderConfirmed";

  static void navigateToDetail({required BuildContext context, required String route, required NFTCardModel nftCardModel}) {
    Navigator.of(context).pushNamed(route, arguments: nftCardModel);
  }

  MaterialPageRoute returnPage(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
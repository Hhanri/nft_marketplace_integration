import 'package:flutter/material.dart';
import 'package:nft_marketplace_integration/helpers/constants.dart';

ThemeData getTheme(BuildContext context) {
  return ThemeData(
    backgroundColor: MyColors.backgroundColor,
    scaffoldBackgroundColor: MyColors.backgroundColor,
    textTheme: const TextTheme(
        headline4: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.purple),
      )
    )
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nft_marketplace_integration/helpers/constants.dart';
import 'package:nft_marketplace_integration/screens/email_confirmation_page/email_confirmation_screen.dart';

class EmailConfirmationPage extends HookWidget {
  const EmailConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 700),
            builder: (context, double value, child) {
              return ShaderMask(
                shaderCallback: (rect) {
                  return RadialGradient(
                    radius: value* 5,
                    colors: const [Colors.white, Colors.white, Colors.transparent, Colors.transparent],
                    stops: const  [0.0, 0.55, 0.6, 1.0],
                    center: const FractionalOffset(0.85, 0.85)
                  ).createShader(rect);
                },
                child: const EmailConfirmationScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

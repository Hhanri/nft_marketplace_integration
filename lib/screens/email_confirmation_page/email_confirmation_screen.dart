import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nft_marketplace_integration/helpers/constants.dart';
import 'package:nft_marketplace_integration/helpers/router.dart';
import 'package:nft_marketplace_integration/widgets/button_widget.dart';
import 'package:nft_marketplace_integration/widgets/footer_container_widget.dart';
import 'package:nft_marketplace_integration/widgets/show_up_animation_widget.dart';

class EmailConfirmationScreen extends HookWidget {
  const EmailConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(duration: const Duration(milliseconds: 1200));
    final colorAnimation = ColorTween(begin: const Color(0xFFE040FB), end: MyColors.backgroundColor).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    Future.delayed(const Duration(milliseconds: 200)).then((value) => controller.forward());

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: colorAnimation.value,
          body: ShowUpAnimationWidget(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email Sent", style: Theme.of(context).textTheme.headline4,),
                      const SizedBox(height: 20,),
                      Text("dfks iodfiosu fiuokjfs posdif[aopdsi foiewpoi d sdopfikp sifo psdfi efsdu fosidjflxkv kldjs lfujiewr oiu  asuid ad apo dkopfwe opifpods klewjrl sdfsfd fsdf", style: Theme.of(context).textTheme.bodyText2,),
                    ],
                  ),
                  const Spacer(),
                  ButtonWidget(
                    text: "HOME",
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.homeRoute, (route) => false);
                    },
                    fullWidth: true
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

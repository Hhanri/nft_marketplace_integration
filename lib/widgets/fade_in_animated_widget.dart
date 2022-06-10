import 'package:flutter/material.dart';

class FadeInAnimatedWidget extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const FadeInAnimatedWidget({Key? key, required this.controller, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: Container(child: child),
        );
      }
    );
  }
}

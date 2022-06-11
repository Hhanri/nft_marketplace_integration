import 'package:flutter/material.dart';

class ShowUpAnimationWidget extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const ShowUpAnimationWidget({Key? key, required this.controller, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    final slideUpAnimation = Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: slideUpAnimation,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: this.child,
          ),
        );
      }
    );
  }
}

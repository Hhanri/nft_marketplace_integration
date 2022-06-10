import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  final String imageLink;
  final AnimationController controller;
  const ImageCardWidget({Key? key,required this.imageLink, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeAnimation = IntTween(begin: 400, end: 200).animate(controller);
    return Hero(
      tag: imageLink,
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              height: sizeAnimation.value.toDouble(),
              width: sizeAnimation.value.toDouble(),
              child: Image.asset(imageLink, fit: BoxFit.cover,)
            ),
          );
        },
        animation: controller,
      ),
    );
  }
}

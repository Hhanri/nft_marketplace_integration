import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  final String imageLink;
  final AnimationController controller;
  const ImageCardWidget({Key? key,required this.imageLink, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeAnimation = Tween<double>(begin: 250, end: 150).animate(controller);
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(40),
      child: Hero(
        tag: imageLink,
        child: AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return Container(
              alignment: Alignment.center,
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              child: Image.asset(imageLink, fit: BoxFit.cover,)
            );
          },
          animation: controller,
        ),
      ),
    );
  }
}

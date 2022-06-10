import 'package:flutter/material.dart';

class FooterContainerWidget extends StatelessWidget {
  final Widget child;
  final double height;
  const FooterContainerWidget({Key? key, required this.child, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).scaffoldBackgroundColor,
            blurRadius: 60,
            spreadRadius: 70
          )
        ]
      ),
      child: child
    );
  }
}

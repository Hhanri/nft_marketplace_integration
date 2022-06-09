import 'package:flutter/material.dart';

class FooterContainerWidget extends StatelessWidget {
  final Column child;
  const FooterContainerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 420,
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

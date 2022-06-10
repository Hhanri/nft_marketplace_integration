import 'package:flutter/material.dart';

class TextRowWidget extends StatelessWidget {
  final String title;
  final String value;
  const TextRowWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        Text(value, style: const TextStyle(color: Colors.white54),)
      ],
    );
  }
}

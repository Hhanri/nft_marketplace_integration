import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool fullWidth;
  const ButtonWidget({Key? key, required this.text, required this.onTap, required this.fullWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: fullWidth
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
            ],
          )
        : Text(text)
    );
  }
}

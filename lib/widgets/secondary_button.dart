import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const SecondaryButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(300, 50)),
        side: WidgetStatePropertyAll(BorderSide(
          width: 3,
          color: Color.fromARGB(255, 165, 67, 32),
        )),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 165, 67, 32),
          fontSize: 16,
        ),
      ),
    );
  }
}

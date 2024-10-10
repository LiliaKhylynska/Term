import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.controller,
    this.isPassword = false,
  });

  final TextEditingController? controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Color.fromARGB(255, 108, 74, 60)),
      cursorColor: const Color.fromARGB(255, 108, 74, 60),
      controller: controller,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final bool isPassword;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.brown),
      cursorColor: AppColors.brown,
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

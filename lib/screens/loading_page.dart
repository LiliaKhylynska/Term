import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.green,
          ),
        ));
  }
}

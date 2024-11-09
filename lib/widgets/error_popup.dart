import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/widgets/primary_button.dart';

class ErrorPopup extends StatelessWidget {
  final String title;
  final String text;

  const ErrorPopup({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Color(0xFFEFEFF4),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'roboto',
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 50),
              child: Text(
                text,
                style: const TextStyle(
                    color: AppColors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'roboto'),
              ),
            ),
            PrimaryButton(
              text: 'Ok',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ]);
  }
}

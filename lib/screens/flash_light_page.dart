import 'package:flash_light_plugin/flash_light_plugin.dart';
import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/secondary_button.dart';

class FlashLightPage extends StatelessWidget {
  const FlashLightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Flash light',
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
            fontFamily: "Blogger-Sans",
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                text: "Turn On",
                onPressed: () {
                  FlashLightPlugin.turnOn();
                }),
            const SizedBox(
              height: 20,
            ),
            SecondaryButton(
                text: "Turn Off",
                onPressed: () {
                  FlashLightPlugin.turnOff();
                })
          ],
        ),
      ),
    );
    ;
  }
}

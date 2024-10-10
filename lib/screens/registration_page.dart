import 'package:flutter/material.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/primary_text_field.dart';
import 'package:term/widgets/secondary_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 233, 236),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(73.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Name',
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 145, 171),
                            fontSize: 16)),
                  ),
                  const Box(
                    child: PrimaryTextField(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Surname',
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 145, 171),
                            fontSize: 16)),
                  ),
                  const Box(
                    child: PrimaryTextField(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 145, 171),
                            fontSize: 16)),
                  ),
                  const Box(
                    child: PrimaryTextField(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Password',
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 145, 171),
                            fontSize: 16)),
                  ),
                  const Box(
                    child: PrimaryTextField(
                      isPassword: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Password confirm',
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 145, 171),
                            fontSize: 16)),
                  ),
                  const Box(
                    child: PrimaryTextField(
                      isPassword: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    text: 'Sing up',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SecondaryButton(
                text: 'Sign in',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

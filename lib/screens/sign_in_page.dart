import 'package:flutter/material.dart';
import 'package:term/screens/dashboard_page.dart';
import 'package:term/screens/home_page.dart';
import 'package:term/screens/registration_page.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/primary_text_field.dart';
import 'package:term/widgets/secondary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final Map<String, String> _users = {
    "Login1": "Password1",
    "Login2": "Password2",
    "Login3": "Password3",
  };

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignIn() {
    var login = loginController.text;
    var password = passwordController.text;
    if (_users.containsKey(login)) {
      if (_users[login] == password) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashboardPage()));
      } else {
        showError('Wrong password');
      }
    } else {
      showError('Wrong login');
    }
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(content: Text(message)),
    );
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 233, 236),
      body: Padding(
        padding: const EdgeInsets.all(73.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: Text('Login',
                      style: TextStyle(
                          color: Color.fromARGB(255, 121, 145, 171),
                          fontSize: 16)),
                ),
                Box(
                  child: PrimaryTextField(controller: loginController),
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
                Box(
                  child: PrimaryTextField(
                    controller: passwordController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: 'Sign in',
                  onPressed: handleSignIn,
                ),
              ],
            ),
            SecondaryButton(
              text: 'Sign up',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

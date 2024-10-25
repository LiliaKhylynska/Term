import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/database/database.dart';
import 'package:term/database/hive_database.dart';
import 'package:term/screens/dashboard_page.dart';
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
  Database database = HiveDatabase();

  Color loginErrorColor = Colors.transparent;
  Color passwordErrorColor = Colors.transparent;

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignIn() async {
    var login = loginController.text;
    var password = passwordController.text;
    var user = await database.get();

    if (user != null && login == user.login) {
      loginErrorColor = Colors.transparent;
      if (password == user.password) {
        passwordErrorColor = Colors.transparent;
        await database.setIsSignedIn(true);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashboardPage()));
      } else {
        setState(() {
          passwordErrorColor = AppColors.orange;
        });
      }
    } else {
      setState(() {
        loginErrorColor = AppColors.orange;
        passwordErrorColor = Colors.transparent;
      });
    }
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
      backgroundColor: AppColors.lightBlue,
      body: SingleChildScrollView(
        child: Padding(
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
                        style: TextStyle(color: AppColors.gray, fontSize: 16)),
                  ),
                  Box(
                    child: PrimaryTextField(controller: loginController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Wrong login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: loginErrorColor,
                            fontFamily: "Blogger-Sans"),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Password',
                        style: TextStyle(color: AppColors.gray, fontSize: 16)),
                  ),
                  Box(
                    child: PrimaryTextField(
                      isPassword: true,
                      controller: passwordController,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 5, bottom: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Wrong password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: passwordErrorColor,
                            fontFamily: "Blogger-Sans"),
                      ),
                    ),
                  ),
                  PrimaryButton(
                    text: 'Sign in',
                    onPressed: handleSignIn,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
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
      ),
    );
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/database/database.dart';
import 'package:term/database/hive_database.dart';
import 'package:term/models/user.dart';
import 'package:term/screens/dashboard_page.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/error_popup.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/primary_text_field.dart';
import 'package:term/widgets/secondary_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Database database = HiveDatabase();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController loginController = TextEditingController();

  Color nameErrorColor = Colors.transparent;
  Color surnameErrorColor = Colors.transparent;
  Color loginErrorColor = Colors.transparent;
  Color passwordErrorColor = Colors.transparent;
  Color passwordConfirmErrorColor = Colors.transparent;


  void handleSignUp() async {
    var hasInternet = await checkInternet();
    if (!hasInternet) {
      await showDialog(
          context: context,
          builder: (BuildContext context) =>
              const ErrorPopup(title: 'Error', text: 'No internet connection'));
      return;
    }
    
    bool nameIsCorrect = nameController.text.isNotEmpty &&
        RegExp(r'^[A-Za-z]+$').hasMatch(nameController.text);
    if (nameIsCorrect) {
      setState(() {
        nameErrorColor = Colors.transparent;
      });
    } else {
      setState(() {
        nameErrorColor = AppColors.orange;
      });
    }

    bool surnameIsCorrect = surnameController.text.isNotEmpty &&
        RegExp(r'^[A-Za-z]+$').hasMatch(surnameController.text);
    if (surnameIsCorrect) {
      setState(() {
        surnameErrorColor = Colors.transparent;
      });
    } else {
      setState(() {
        surnameErrorColor = AppColors.orange;
      });
    }

    bool loginIsCorrect = loginController.text.isNotEmpty;
    if (loginIsCorrect) {
      setState(() {
        loginErrorColor = Colors.transparent;
      });
    } else {
      setState(() {
        loginErrorColor = AppColors.orange;
      });
    }

    bool passwordIsCorrect = passwordController.text.length > 4;
    if (passwordIsCorrect) {
      setState(() {
        passwordErrorColor = Colors.transparent;
      });
    } else {
      setState(() {
        passwordErrorColor = AppColors.orange;
      });
    }

    bool passwordConfirmIsCorrect =
        passwordController.text == passwordConfirmController.text;
    if (passwordConfirmIsCorrect) {
      setState(() {
        passwordConfirmErrorColor = Colors.transparent;
      });
    } else {
      setState(() {
        passwordConfirmErrorColor = AppColors.orange;
      });
    }

    if (nameIsCorrect &&
        surnameIsCorrect &&
        loginIsCorrect &&
        passwordIsCorrect &&
        passwordConfirmIsCorrect) {
      User user = User(
        name: nameController.text,
        surname: surnameController.text,
        login: loginController.text,
        password: passwordController.text,
      );
      await database.save(user);
      await database.setIsSignedIn(true);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DashboardPage()));
    } 
  }
  
  Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    loginController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
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
                        style: TextStyle(color: AppColors.gray, fontSize: 16)),
                  ),
                  Box(
                    child: PrimaryTextField(
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Name can not be empty',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: nameErrorColor,
                            fontFamily: "Blogger-Sans"),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Surname',
                        style: TextStyle(color: AppColors.gray, fontSize: 16)),
                  ),
                  Box(
                    child: PrimaryTextField(
                      controller: surnameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Wrong surname',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: surnameErrorColor,
                            fontFamily: "Blogger-Sans"),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Login',
                        style: TextStyle(color: AppColors.gray, fontSize: 16)),
                  ),
                  Box(
                    child: PrimaryTextField(
                      controller: loginController,
                    ),
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
                    padding: const EdgeInsets.only(right: 10, top: 5),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Password confirm',
                        style: TextStyle(color: AppColors.gray, fontSize: 16)),
                  ),
                  Box(
                    child: PrimaryTextField(
                      isPassword: true,
                      controller: passwordConfirmController,
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
                            color: passwordConfirmErrorColor,
                            fontFamily: "Blogger-Sans"),
                      ),
                    ),
                  ),
                  PrimaryButton(
                    text: 'Sing up',
                    onPressed: handleSignUp,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SecondaryButton(
                text: 'Sign in',
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
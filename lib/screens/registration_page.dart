import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term/constants/colors.dart';
import 'package:term/screens/blocs/registration_bloc.dart';
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

  
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) async {
        if (state is NoInternetState) {
          await showDialog(
              context: context,
              builder: (BuildContext context) => const ErrorPopup(
                  title: 'Error', text: 'No internet connection'));
        } else if (state is SignedUpState) {
          setState(() {
            passwordErrorColor = Colors.transparent;
            loginErrorColor = Colors.transparent;
          });
    
          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const DashboardPage()));
        } else if (state is WrongPasswordState) {
          setState(() {
          passwordErrorColor = AppColors.orange;
          passwordConfirmErrorColor = Colors.transparent;
          loginErrorColor = Colors.transparent;
          nameErrorColor = Colors.transparent;
          surnameErrorColor = Colors.transparent;
          });
        } else if (state is WrongLoginState) {
          setState(() {
          loginErrorColor = AppColors.orange;
          passwordErrorColor = Colors.transparent;
          passwordConfirmErrorColor = Colors.transparent;
          nameErrorColor = Colors.transparent;
          surnameErrorColor = Colors.transparent;
          });
        } else if (state is WrongNameState) {
          setState(() {
          nameErrorColor = AppColors.orange;
          loginErrorColor = Colors.transparent;
          passwordErrorColor = Colors.transparent;
          passwordConfirmErrorColor = Colors.transparent;
          surnameErrorColor = Colors.transparent;
          });
        } else if (state is WrongPasswordConfirmState) {
          setState(() {
          passwordConfirmErrorColor = AppColors.orange;
          nameErrorColor = Colors.transparent;
          loginErrorColor = Colors.transparent;
          passwordErrorColor = Colors.transparent;
          surnameErrorColor = Colors.transparent;
          });
        } else if (state is WrongSurenameState) {
          setState(() {
          surnameErrorColor = AppColors.orange;
          passwordConfirmErrorColor = Colors.transparent;
          nameErrorColor = Colors.transparent;
          loginErrorColor = Colors.transparent;
          passwordErrorColor = Colors.transparent;
          });
        }
      },
      child: Scaffold(
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
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
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
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
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
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
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
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
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
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
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
                      onPressed: () {
                        context.read<RegistrationBloc>().add(TapSignUpEvent(
                          login: loginController.text,
                          name: nameController.text,
                          surname: surnameController.text,
                          password: passwordController.text,
                          confirmPassword: passwordConfirmController.text,
                        ));
                      },
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
      ),
    );
  }
}

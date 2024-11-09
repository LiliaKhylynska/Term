import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/database/database.dart';
import 'package:term/database/hive_database.dart';
import 'package:term/models/user.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/primary_text_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  Database database = HiveDatabase();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Color nameErrorColor = Colors.transparent;
  Color surnameErrorColor = Colors.transparent;
  Color loginErrorColor = Colors.transparent;
  Color emailErrorColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    database.get().then((User? user) {
      if (user != null) {
        setState(() {
          nameController.text = user.name;
          surnameController.text = user.surname;
          loginController.text = user.login;
          emailController.text = user.email ?? "";
        });
      }
    });
  }

  void save() async {
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

    bool emailIsCorrect = emailController.text.isEmpty ||
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(emailController.text);
    if (emailIsCorrect) {
      setState(() {
        emailErrorColor = Colors.transparent;
      });
    } else {
      setState(() {
        emailErrorColor = AppColors.orange;
      });
    }

    if (nameIsCorrect && surnameIsCorrect && loginIsCorrect && emailIsCorrect) {
      var oldUser = await database.get();
      if (oldUser != null) {
        User user = User(
          name: nameController.text,
          surname: surnameController.text,
          login: loginController.text,
          password: oldUser.password,
          email: emailController.text,
        );
        await database.save(user);
        Navigator.pop(context, user);
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    loginController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.brown),
        title: const Text(
          'Edit profile',
          style: TextStyle(
            color: AppColors.brown,
            fontWeight: FontWeight.bold,
            fontFamily: "Blogger-Sans",
          ),
        ),
      ),
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
                    child: Text('Email',
                        style: TextStyle(color: AppColors.gray, fontSize: 16)),
                  ),
                  Box(
                    child: PrimaryTextField(
                      controller: emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Wrong email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: emailErrorColor,
                            fontFamily: "Blogger-Sans"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                    text: 'Save',
                    onPressed: save,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

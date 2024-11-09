import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/database/database.dart';
import 'package:term/database/hive_database.dart';
import 'package:term/models/user.dart';
import 'package:term/screens/profile_edit_page.dart';
import 'package:term/screens/registration_page.dart';
import 'package:term/screens/sign_in_page.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/popup.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/secondary_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String surname = '';
  String login = '';
  String email = '';

  final Database database = HiveDatabase();

  @override
  void initState() {
    super.initState();
    database.get().then((User? user) {
      if (user != null) {
        setState(() {
          name = user.name;
          surname = user.surname;
          login = user.login;
          email = user.email ?? "";
        });
      }
    });
  }

  void handleSignOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Popup(
        title: 'Sign out',
        text: 'Do you want to sign out?',
        onNoPressed: () {
          Navigator.pop(context, false);
        },
        onYesPressed: () {
          Navigator.pop(context, true);
        },
      ),
    ).then((value) async {
      var result = value as bool;
      if (result) {
        await database.setIsSignedIn(false);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      }
    });
  }

  void handleDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Popup(
        title: 'Delete profile',
        text: 'Do you want to delete profile?',
        onNoPressed: () {
          Navigator.pop(context, false);
        },
        onYesPressed: () {
          Navigator.pop(context, true);
        },
      ),
    ).then((value) async {
      var result = value as bool;
      if (result) {
        await database.delete();
        await database.setIsSignedIn(false);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RegistrationPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
            fontFamily: "Blogger-Sans",
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/Zinnia.jpg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Box(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First name: $name',
                          style: const TextStyle(
                              color: AppColors.brown,
                              fontFamily: "Blogger-Sans",
                              fontSize: 20),
                        ),
                        Text(
                          'Last name: $surname',
                          style: const TextStyle(
                              color: AppColors.brown,
                              fontFamily: "Blogger-Sans",
                              fontSize: 20),
                        ),
                        Text(
                          'Login: $login',
                          style: const TextStyle(
                              color: AppColors.brown,
                              fontFamily: "Blogger-Sans",
                              fontSize: 20),
                        ),
                        Text(
                          'Email: $email',
                          style: const TextStyle(
                              color: AppColors.brown,
                              fontFamily: "Blogger-Sans",
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProfileEditPage())).then((user) {
                        if (user is User) {
                          setState(() {
                            name = user.name;
                            surname = user.surname;
                            login = user.login;
                            email = user.email ?? '';
                          });
                        }
                      });
                    },
                    icon: const Icon(Icons.edit),
                    color: AppColors.green,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              text: 'Sign out',
              onPressed: handleSignOut,
            ),
            const SizedBox(
              height: 40,
            ),
            SecondaryButton(
              text: 'Delete profile',
              onPressed: handleDelete,
            )
          ],
        ),
      ),
    );
  }
}

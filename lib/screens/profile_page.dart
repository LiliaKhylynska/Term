import 'package:flutter/material.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/secondary_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String firstName = 'Katya';
  String lastName = 'Dobush';
  String login = 'katya_dobush';
  String email = 'qwerty@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 233, 236),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 17, 112, 130),
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
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                // border: Border.all(width: 3.0, color: Color.fromARGB(255, 94, 194, 164)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
                color: Color.fromARGB(255, 239, 238, 242),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 179, 207, 213),
                      blurRadius: 0.0,
                      offset: Offset(2, 2))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First name: $firstName',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 108, 74, 60),
                        fontFamily: "Blogger-Sans",
                        fontSize: 20),
                  ),
                  Text(
                    'Last name: $lastName',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 108, 74, 60),
                        fontFamily: "Blogger-Sans",
                        fontSize: 20),
                  ),
                  Text(
                    'Login: $login',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 108, 74, 60),
                        fontFamily: "Blogger-Sans",
                        fontSize: 20),
                  ),
                  Text(
                    'email: $email',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 108, 74, 60),
                        fontFamily: "Blogger-Sans",
                        fontSize: 20),
                  )
                ],
              ),
            ),
            PrimaryButton(
              text: 'Sign out',
              onPressed: () {},
            ),
            SizedBox(
              height: 40,
            ),
            SecondaryButton(
              text: 'Delete profile',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

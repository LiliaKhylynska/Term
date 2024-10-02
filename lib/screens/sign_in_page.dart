import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 243, 241),
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
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Login',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 55, 34), fontSize: 16)),
                ),
                TextField(
                  controller: loginController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 62, 83, 199), width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 55, 34), width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Password',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 55, 34), fontSize: 16)),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 62, 83, 199), width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 55, 34), width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: handleSignIn,
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 94, 194, 164)),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrationPage()));
              },
              style: const ButtonStyle(
                side: WidgetStatePropertyAll(BorderSide(
                  width: 3,
                  color: Color.fromARGB(255, 94, 194, 164),
                )),
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 194, 164),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

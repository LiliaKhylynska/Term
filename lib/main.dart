import 'package:flutter/material.dart';
import 'package:term/screens/sign_in_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      home: const SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

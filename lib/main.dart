import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:term/database/database.dart';
import 'package:term/database/firebase_database.dart';
import 'package:term/database/hive_database.dart';
import 'package:term/screens/dashboard_page.dart';
import 'package:term/screens/loading_page.dart';
import 'package:term/screens/sign_in_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      home: FutureBuilder<bool>(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data ?? false) {
              return const DashboardPage();
            } else {
              return const SignInPage();
            }
          } else {
            return const LoadingPage();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Future<bool> init() async {
   
    Database database = FirebaseDatabase();
    await database.init();
    return await database.getIsSignedIn();
  }
}

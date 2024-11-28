import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:term/database/database.dart';
import 'package:term/models/user.dart';

class FirebaseDatabase implements Database {
  final String databaseName = 'Database';
  final String loginKey = 'login';
  final String passwordKey = 'password';
  final String nameKey = 'name';
  final String surnameKey = 'surname';
  final String emailKey = 'email';
  final String isSignedInKey = 'isSignedIn';

  @override
  Future<void> delete() async {
    await FirebaseFirestore.instance
        .collection(databaseName)
        .doc('4Qj2wzAcgxZOxOlWQCWQ')
        .update({
      nameKey: null,
      surnameKey: null,
      loginKey: null,
      passwordKey: null,
      emailKey: null,
      isSignedInKey: null
    });
  }

  @override
  Future<User?> get() async {
    var document = await FirebaseFirestore.instance
        .collection(databaseName)
        .doc('4Qj2wzAcgxZOxOlWQCWQ')
        .get();

    var name = document[nameKey];
    var surname = document[surnameKey];
    var login = document[loginKey];
    var password = document[passwordKey];
    var email = document[emailKey];

    if (name != null && surname != null && login != null && password != null) {
      return User(
          name: name,
          surname: surname,
          login: login,
          password: password,
          email: email);
    } else {
      return null;
    }
  }

  @override
  Future<bool> getIsSignedIn() async {
    var document = await FirebaseFirestore.instance
        .collection(databaseName)
        .doc('4Qj2wzAcgxZOxOlWQCWQ')
        .get();
    return document[isSignedInKey] as bool;
  }

  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  Future<void> save(User user) async {
    await FirebaseFirestore.instance
        .collection(databaseName)
        .doc('4Qj2wzAcgxZOxOlWQCWQ')
        .update({
      nameKey: user.name,
      surnameKey: user.surname,
      loginKey: user.login,
      passwordKey: user.password,
      emailKey: user.email,
    });
  }

  @override
  Future<void> setIsSignedIn(bool isSignedIn) async {
    await FirebaseFirestore.instance
        .collection(databaseName)
        .doc('4Qj2wzAcgxZOxOlWQCWQ')
        .update({isSignedInKey: isSignedIn});
  }
}

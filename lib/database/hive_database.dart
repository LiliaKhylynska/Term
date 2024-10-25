import 'package:hive_flutter/hive_flutter.dart';
import 'package:term/database/database.dart';
import 'package:term/models/user.dart';

class HiveDatabase implements Database {
  final String databaseName = 'Database';
  final String loginKey = 'login';
  final String passwordKey = 'password';
  final String nameKey = 'name';
  final String surnameKey = 'surname';
  final String emailKey = 'email';
  final String isSignedInKey = 'isSignedIn';

  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  @override
  Future<void> save(User user) async {
    var box = await Hive.openBox(databaseName);
    await box.put(loginKey, user.login);
    await box.put(passwordKey, user.password);
    await box.put(surnameKey, user.surname);
    await box.put(emailKey, user.email);
    await box.put(nameKey, user.name);
    await box.close();
  }

  @override
  Future<User?> get() async {
    var box = await Hive.openBox(databaseName);
    var name = await box.get(nameKey) as String?;
    var surname = await box.get(surnameKey) as String?;
    var login = await box.get(loginKey) as String?;
    var password = await box.get(passwordKey) as String?;
    var email = await box.get(emailKey) as String?;
    await box.close();

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
  Future<void> delete() async {
    var box = await Hive.openBox(databaseName);
    await box.deleteAll([nameKey, surnameKey, loginKey, passwordKey, emailKey]);
  }

  @override
  Future<void> setIsSignedIn(bool isSignedIn) async {
    var box = await Hive.openBox(databaseName);
    await box.put(isSignedInKey, isSignedIn);
    await box.close();
  }

  @override
  Future<bool> getIsSignedIn() async {
    var box = await Hive.openBox(databaseName);
    var result = await box.get(isSignedInKey) as bool?;
    await box.close();
    return result ?? false;
  }
  //@override
  // Future<void> save(String login, String password) async {
  //   var database = await Hive.openBox(name);
  //   await database.put(loginKey, login);
  //   await database.put(passwordKey, password);
  //   await database.close();
  // }
}

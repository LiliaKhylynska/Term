import 'package:term/models/user.dart';

abstract class Database {
  Future<void> init();
  Future<void> save(User user);
  Future<User?> get();
  Future<void> delete();
  Future<void> setIsSignedIn(bool isSignedIn);
  Future<bool> getIsSignedIn();
}

class User {
  String name;
  String surname;
  String login;
  String password;
  String? email;

  User({
    required this.name,
    required this.surname,
    required this.login,
    required this.password,
    this.email,
  });
}

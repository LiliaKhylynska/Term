import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term/database/database.dart';
import 'package:term/models/user.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final Database database;

  RegistrationBloc({required this.database}) : super(RegistrationInitialState()) {
    on<TapSignUpEvent>(OnTapSignUpEvent);
  }

  FutureOr<void> OnTapSignUpEvent(event, emit) async {
    var hasInternet = await checkInternet();
    if (!hasInternet) {
      emit(NoInternetState());
      return;
    }

    bool nameIsCorrect =
        event.name.isNotEmpty && RegExp(r'^[A-Za-z]+$').hasMatch(event.name);
    if (!nameIsCorrect) {
      emit(WrongNameState());
    }

    bool surnameIsCorrect = event.surname.isNotEmpty &&
        RegExp(r'^[A-Za-z]+$').hasMatch(event.surname);
    if (!surnameIsCorrect) {
      emit(WrongSurenameState());
    }

    bool loginIsCorrect = event.login.isNotEmpty;
    if (!loginIsCorrect) {
      emit(WrongLoginState());
    }

    bool passwordIsCorrect = event.password.length > 4;
    if (!passwordIsCorrect) {
      emit(WrongPasswordState());
    }

    bool passwordConfirmIsCorrect = event.password == event.confirmPassword;
    if (!passwordConfirmIsCorrect) {
      emit(WrongPasswordConfirmState());
    }

    if (nameIsCorrect &&
        surnameIsCorrect &&
        loginIsCorrect &&
        passwordIsCorrect &&
        passwordConfirmIsCorrect) {
      User user = User(
        name: event.name,
        surname: event.surname,
        login: event.login,
        password: event.password,
      );
      await database.save(user);
      await database.setIsSignedIn(true);
      emit(SignedUpState());
    }
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}

// States

class RegistrationState {}

class RegistrationInitialState extends RegistrationState {}

class NoInternetState extends RegistrationState {}

class SignedUpState extends RegistrationState {}

class WrongPasswordState extends RegistrationState {}

class WrongLoginState extends RegistrationState {}

class WrongNameState extends RegistrationState {}

class WrongSurenameState extends RegistrationState {}

class WrongPasswordConfirmState extends RegistrationState {}

// Events

class RegistrationEvent {}

class TapSignUpEvent extends RegistrationEvent {
  String login;
  String password;
  String name;
  String surname;
  String confirmPassword;

  TapSignUpEvent(
      {required this.login,
      required this.password,
      required this.confirmPassword,
      required this.name,
      required this.surname});
}

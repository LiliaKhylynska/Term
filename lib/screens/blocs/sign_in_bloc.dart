import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term/database/database.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final Database database;

  SignInBloc({required this.database}) : super(SignInInitialState()) {
    on<TapSignInEvent>(OnTapSignEvent);

    on<TapSignUpEvent>((event, emit) async {});
  }

  FutureOr<void> OnTapSignEvent(event, emit) async {
    var hasInternet = await checkInternet();
    if (!hasInternet) {
      emit(NoInternetState());
      return;
    }

    var user = await database.get();

    if (user != null && event.login == user.login) {
      if (event.password == user.password) {
        await database.setIsSignedIn(true);
        emit(SignedInState());
      } else {
        emit(WrongPasswordState());
      }
    } else {
      emit(WrongLoginState());
    }
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    return !connectivityResult.contains(ConnectivityResult.none);
  }
}

// States

class SignInState {}

class SignInInitialState extends SignInState {}

class NoInternetState extends SignInState {}

class SignedInState extends SignInState {}

class WrongPasswordState extends SignInState {}

class WrongLoginState extends SignInState {}

// Events

class SignInEvent {}

class TapSignInEvent extends SignInEvent {
  String login;
  String password;

  TapSignInEvent({required this.login, required this.password});
}

class TapSignUpEvent extends SignInEvent {}

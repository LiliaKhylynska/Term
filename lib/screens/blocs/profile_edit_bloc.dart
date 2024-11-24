import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term/database/database.dart';
import 'package:term/models/user.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final Database database;
  User? user;

  ProfileEditBloc({required this.database}) : super(ProfileEditInitialState()) {
    on<LoadDataEvent>((event, emit) async {
      user = await database.get();
      emit(DataLoadedState(user: user));
    });
    on<TapSaveEvent>(OnTapSaveEvent);
  }

  FutureOr<void> OnTapSaveEvent(event, emit) async {
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

    bool emailIsCorrect = event.email.isEmpty ||
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(event.email);
    if (!emailIsCorrect) {
      emit(WrongEmailState());
    }

    if (nameIsCorrect && surnameIsCorrect && loginIsCorrect && emailIsCorrect) {
      User newUser = User(
        name: event.name,
        surname: event.surname,
        login: event.login,
        password: user!.password,
        email: event.email,
      );
      await database.save(newUser);
      emit(SavedState());
    }
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}

// States

class ProfileEditState {}

class DataLoadedState extends ProfileEditState {
  final User? user;

  DataLoadedState({required this.user});
}

class ProfileEditInitialState extends ProfileEditState {}

class NoInternetState extends ProfileEditState {}

class SavedState extends ProfileEditState {}

class WrongEmailState extends ProfileEditState {}

class WrongLoginState extends ProfileEditState {}

class WrongNameState extends ProfileEditState {}

class WrongSurenameState extends ProfileEditState {}

// Events

class ProfileEditEvent {}

class LoadDataEvent extends ProfileEditEvent {}

class TapSaveEvent extends ProfileEditEvent {
  String login;
  String email;
  String name;
  String surname;

  TapSaveEvent(
      {required this.login,
      required this.email,
      required this.name,
      required this.surname});
}

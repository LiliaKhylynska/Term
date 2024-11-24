import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term/database/database.dart';
import 'package:term/models/user.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Database database;

  ProfileBloc({required this.database}) : super(ProfileState()) {
    on<LoadDataEvent>((event, emit) async {
      var user = await database.get();
      emit(DataLoadedState(user: user));
    });

    on<DeleteProfileEvent>((event, emit) async {
      await database.delete();
      await database.setIsSignedIn(false);
      emit(DeletedProfileState());
    });

    on<SignOutEvent>((event, emit) async {
      await database.setIsSignedIn(false);
      emit(SignedOutState());
    });
  }
}

//States
class ProfileState {}

class SignedOutState extends ProfileState {}

class DeletedProfileState extends ProfileState {}

class DataLoadedState extends ProfileState {
  final User? user;

  DataLoadedState({required this.user});
}

//Events
class ProfileEvent {}

class LoadDataEvent extends ProfileEvent {}

class DeleteProfileEvent extends ProfileEvent {}

class SignOutEvent extends ProfileEvent {}

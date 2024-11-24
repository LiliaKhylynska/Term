import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term/constants/colors.dart';
import 'package:term/models/user.dart';
import 'package:term/screens/blocs/profile_bloc.dart';
import 'package:term/screens/profile_edit_page.dart';
import 'package:term/screens/registration_page.dart';
import 'package:term/screens/sign_in_page.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/popup.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/secondary_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String surname = '';
  String login = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadDataEvent());
  }

  void handleSignOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Popup(
        title: 'Sign out',
        text: 'Do you want to sign out?',
        onYesPressed: () {
          context.read<ProfileBloc>().add(SignOutEvent());
        },
      ),
    );
  }

  void handleDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Popup(
        title: 'Delete profile',
        text: 'Do you want to delete profile?',
        onYesPressed: () {
          context.read<ProfileBloc>().add(DeleteProfileEvent());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state is DataLoadedState) {
          setState(() {
            name = state.user?.name ?? "";
            surname = state.user?.surname ?? "";
            login = state.user?.login ?? "";
            email = state.user?.email ?? "";
          });
        } else if (state is SignedOutState) {
          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInPage()));
        } else if (state is DeletedProfileState) {
          await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const RegistrationPage()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontFamily: "Blogger-Sans",
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/Zinnia.jpg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Box(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First name: $name',
                            style: const TextStyle(
                                color: AppColors.brown,
                                fontFamily: "Blogger-Sans",
                                fontSize: 20),
                          ),
                          Text(
                            'Last name: $surname',
                            style: const TextStyle(
                                color: AppColors.brown,
                                fontFamily: "Blogger-Sans",
                                fontSize: 20),
                          ),
                          Text(
                            'Login: $login',
                            style: const TextStyle(
                                color: AppColors.brown,
                                fontFamily: "Blogger-Sans",
                                fontSize: 20),
                          ),
                          Text(
                            'Email: $email',
                            style: const TextStyle(
                                color: AppColors.brown,
                                fontFamily: "Blogger-Sans",
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileEditPage())).then((user) {
                          if (user is User) {
                            setState(() {
                              name = user.name;
                              surname = user.surname;
                              login = user.login;
                              email = user.email ?? '';
                            });
                          }
                        });
                      },
                      icon: const Icon(Icons.edit),
                      color: AppColors.green,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                text: 'Sign out',
                onPressed: handleSignOut,
              ),
              const SizedBox(
                height: 40,
              ),
              SecondaryButton(
                text: 'Delete profile',
                onPressed: handleDelete,
              )
            ],
          ),
        ),
      ),
    );
  }
}

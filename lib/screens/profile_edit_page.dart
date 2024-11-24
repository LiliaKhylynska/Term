import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term/constants/colors.dart';
import 'package:term/screens/blocs/profile_bloc.dart' as profile;
import 'package:term/screens/blocs/profile_edit_bloc.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/error_popup.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/primary_text_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Color nameErrorColor = Colors.transparent;
  Color surnameErrorColor = Colors.transparent;
  Color loginErrorColor = Colors.transparent;
  Color emailErrorColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    context.read<ProfileEditBloc>().add(LoadDataEvent());
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    loginController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileEditBloc, ProfileEditState>(
      listener: (context, state) async {
        if (state is DataLoadedState) {
          setState(() {
            nameController.text = state.user?.name ?? "";
            surnameController.text = state.user?.surname ?? "";
            loginController.text = state.user?.login ?? "";
            emailController.text = state.user?.email ?? "";
          });
        } else if (state is NoInternetState) {
          await showDialog(
              context: context,
              builder: (BuildContext context) => const ErrorPopup(
                  title: 'Error', text: 'No internet connection'));
        } else if (state is SavedState) {
          setState(() {
            emailErrorColor = Colors.transparent;
            loginErrorColor = Colors.transparent;
            nameErrorColor = Colors.transparent;
            surnameErrorColor = Colors.transparent;
          });

          context.read<profile.ProfileBloc>().add(profile.LoadDataEvent());
          Navigator.pop(context);
        } else if (state is WrongEmailState) {
          setState(() {
            emailErrorColor = AppColors.orange;
            loginErrorColor = Colors.transparent;
            nameErrorColor = Colors.transparent;
            surnameErrorColor = Colors.transparent;
          });
        } else if (state is WrongLoginState) {
          setState(() {
            loginErrorColor = AppColors.orange;
            emailErrorColor = Colors.transparent;
            nameErrorColor = Colors.transparent;
            surnameErrorColor = Colors.transparent;
          });
        } else if (state is WrongNameState) {
          setState(() {
            nameErrorColor = AppColors.orange;
            loginErrorColor = Colors.transparent;
            emailErrorColor = Colors.transparent;
            surnameErrorColor = Colors.transparent;
          });
        } else if (state is WrongSurenameState) {
          setState(() {
            surnameErrorColor = AppColors.orange;
            nameErrorColor = Colors.transparent;
            loginErrorColor = Colors.transparent;
            emailErrorColor = Colors.transparent;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.brown),
          title: const Text(
            'Edit profile',
            style: TextStyle(
              color: AppColors.brown,
              fontWeight: FontWeight.bold,
              fontFamily: "Blogger-Sans",
            ),
          ),
        ),
        backgroundColor: AppColors.lightBlue,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(73.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text('Name',
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
                    ),
                    Box(
                      child: PrimaryTextField(
                        controller: nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Name can not be empty',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: nameErrorColor,
                              fontFamily: "Blogger-Sans"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text('Surname',
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
                    ),
                    Box(
                      child: PrimaryTextField(
                        controller: surnameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Wrong surname',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: surnameErrorColor,
                              fontFamily: "Blogger-Sans"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text('Login',
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
                    ),
                    Box(
                      child: PrimaryTextField(
                        controller: loginController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Wrong login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: loginErrorColor,
                              fontFamily: "Blogger-Sans"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text('Email',
                          style:
                              TextStyle(color: AppColors.gray, fontSize: 16)),
                    ),
                    Box(
                      child: PrimaryTextField(
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Wrong email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: emailErrorColor,
                              fontFamily: "Blogger-Sans"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      text: 'Save',
                      onPressed: () {
                        context.read<ProfileEditBloc>().add(TapSaveEvent(
                            login: loginController.text,
                            email: emailController.text,
                            name: nameController.text,
                            surname: surnameController.text));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

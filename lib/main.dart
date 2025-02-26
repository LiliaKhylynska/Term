import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:term/database/database.dart';
import 'package:term/database/firebase_database.dart';
import 'package:term/database/hive_database.dart';
import 'package:term/screens/blocs/profile_bloc.dart';
import 'package:term/screens/blocs/profile_edit_bloc.dart';
import 'package:term/screens/blocs/registration_bloc.dart';
import 'package:term/screens/blocs/sign_in_bloc.dart';
import 'package:term/screens/dashboard_page.dart';
import 'package:term/screens/loading_page.dart';
import 'package:term/screens/sign_in_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Database>(
      create: (context) => HiveDatabase(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(
            create: (BuildContext context) =>
                ProfileBloc(database: context.read<Database>()),
          ),
          BlocProvider<ProfileEditBloc>(
            create: (BuildContext context) =>
                ProfileEditBloc(database: context.read<Database>()),
          ),
          BlocProvider<SignInBloc>(
            create: (BuildContext context) =>
                SignInBloc(database: context.read<Database>()),
          ),
          BlocProvider<RegistrationBloc>(
            create: (BuildContext context) =>
                RegistrationBloc(database: context.read<Database>()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.cyan),
          home: FutureBuilder<bool>(
            future: init(context),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data ?? false) {
                  return const DashboardPage();
                } else {
                  return const SignInPage();
                }
              } else {
                return const LoadingPage();
              }
            },
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  Future<bool> init(BuildContext context) async {
    Database database = HiveDatabase();
    await database.init();
    return await database.getIsSignedIn();
  }
}

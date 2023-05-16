import 'package:flutter/material.dart';
import 'package:vinay_app/constraints/routes.dart';
import 'package:vinay_app/services/auth/auth_service.dart';
import 'package:vinay_app/views/login_views.dart';
import 'package:vinay_app/views/notes_view.dart';
import 'package:vinay_app/views/register_view.dart';
import 'package:vinay_app/views/verify_email_view.dart';
import 'dart:developer' as devtools show log;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NoteView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final users = AuthService.firebase().currentUser;
            if (users != null) {
              if (users.isEmailVerified) {
                return const NoteView();
              } else {
                devtools.log(users.isEmailVerified.toString());
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

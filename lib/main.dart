import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vinay_app/constraints/routes.dart';
import 'package:vinay_app/views/login_views.dart';
import 'package:vinay_app/views/register_view.dart';
import 'package:vinay_app/views/verify_email_view.dart';
import 'firebase_options.dart';
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
        loginRout: (context) => const LoginView(),
        registerRout: (context) => const RegisterView(),
        notesRout: (context) => const NoteView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final users = FirebaseAuth.instance.currentUser;
            if (users != null) {
              if (users.emailVerified) {
                return const NoteView();
              } else {
                devtools.log(users.emailVerified.toString());
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

enum MenuAction { logout }

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Notes'),
          actions: [
            PopupMenuButton<MenuAction>(onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldlogout = await showLogoutDialog(context);
                  if (shouldlogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRout,
                      (_) => false,
                    );
                  }
                  devtools.log(shouldlogout.toString());
                  break;
              }
            }, itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                    value: MenuAction.logout, child: Text('logout'))
              ];
            }),
          ],
        ),
        body: const Text('Hello world'));
  }
}

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('sign out'),
        content: const Text('Are you sure to sign out?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sign out')),
        ],
      );
    },
  ).then((value) => value ?? false);
}

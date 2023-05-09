import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:vinay_app/constraints/routes.dart';

import '../utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: ('Enter your email !')),
            keyboardType: TextInputType.emailAddress,
            controller: _email,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Enter your password '),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: _password,
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password);
                devtools.log(userCredential.toString());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'week-password') {
                  await showErrorDialog(context, 'week password');
                } else if (e.code == 'email-already-in-use') {
                  await showErrorDialog(context, 'Email already in use');
                } else if (e.code == 'invalid-email') {
                  await showErrorDialog(context, 'invalid email');
                } else if (e.code == 'done') {
                  await showErrorDialog(
                      context, 'You have sucessfully registred');
                } else {
                  await showErrorDialog(
                    context,
                    e.toString(),
                  );
                }
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRout,
                  (route) => false,
                );
              },
              child: const Text('Already registred? Login here!'))
        ],
      ),
    );
  }
}

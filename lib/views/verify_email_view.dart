import 'package:flutter/material.dart';
import 'package:vinay_app/constraints/routes.dart';
import 'package:vinay_app/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('verify email')),
      body: Column(
        children: [
          const Text("we've sentyou to a mail please verify it"),
          const Text('please verify your email address:'),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text(' click here to send email verification'),
          ),
          TextButton(
              onPressed: () {
                AuthService.firebase().logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Restart'))
        ],
      ),
    );
  }
}

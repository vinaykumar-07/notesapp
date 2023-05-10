import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);
  factory AuthUser.fromfirebase(User user) => AuthUser(user.emailVerified);
}

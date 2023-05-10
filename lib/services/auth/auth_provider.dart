import 'dart:ffi';

import 'package:vinay_app/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;
  Future<AuthUser> login({
    required String email,
    required String password,
  });
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<Void> logout();
  Future<Void> sendEmailVerification();

}

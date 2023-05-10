import 'dart:ffi';
import 'package:vinay_app/services/auth/auth_provider.dart';
import 'package:vinay_app/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  AuthService(this.provider);

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) =>
      provider.login(
        email: email,
        password: password,
      );

  @override
  Future<Void> logout() => provider.logout();

  @override
  Future<Void> sendEmailVerification() => provider.sendEmailVerification();
}

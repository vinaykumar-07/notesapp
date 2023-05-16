// import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinay_app/services/auth/auth_provider.dart';
import 'package:vinay_app/services/auth/auth_user.dart';
import 'package:vinay_app/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);
  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());
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
  Future<void> logout() => provider.logout();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();
}






// class AuthService implements AuthProvider {
//   final AuthProvider provider;
//   AuthService(this.provider);
//   factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

//   @override
//   Future<AuthUser> createUser({
//     required String email,
//     required String password,
//   }) =>
//       provider.createUser(
//         email: email,
//         password: password,
//       );

//   @override
//   AuthUser? get currentUser => provider.currentUser;

//   @override
//   Future<AuthUser> login({
//     required String email,
//     required String password,
//   }) =>
//       provider.login(
//         email: email,
//         password: password,
//       );

//   @override
//   Future<void> logout() => provider.logout();

//   @override
//   Future<void> sendEmailVerification() => provider.sendEmailVerification();
// }

// AuthProvider FirebaseAuthProvider() {
//   final user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     throw user;
//   } else {
//     throw UserNotLoggedInAuthException();
//   }
// }

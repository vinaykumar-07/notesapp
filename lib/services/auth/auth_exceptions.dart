//  registation exceptions
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

class DoneAuthException implements Exception {}

//  login exception
class WrongPasswordAuthException implements Exception {}

class UserNotFoundAuthException implements Exception {}

// generic exception

class UserNotLoggedInAuthException implements Exception {}

class GenericAuthException implements Exception {}

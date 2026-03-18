enum AuthFailureType { invalidCredentials, unknown }

class AuthFailure implements Exception {
  const AuthFailure(this.type);

  final AuthFailureType type;

  @override
  String toString() => 'AuthFailure($type)';
}

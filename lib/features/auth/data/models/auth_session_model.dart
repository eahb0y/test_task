import '../../domain/entities/auth_session.dart';

class AuthSessionModel extends AuthSession {
  const AuthSessionModel({
    required super.token,
    required super.email,
    required super.userId,
    required super.expiresAt,
  });
}

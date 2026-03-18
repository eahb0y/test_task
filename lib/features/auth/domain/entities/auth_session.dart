import 'package:equatable/equatable.dart';

class AuthSession extends Equatable {
  const AuthSession({
    required this.token,
    required this.email,
    required this.userId,
    required this.expiresAt,
  });

  final String token;
  final String email;
  final String userId;
  final DateTime expiresAt;

  bool get isExpired => expiresAt.isBefore(DateTime.now());

  @override
  List<Object?> get props => <Object?>[token, email, userId, expiresAt];
}

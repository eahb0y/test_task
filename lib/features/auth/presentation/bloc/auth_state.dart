import 'package:equatable/equatable.dart';

import '../../domain/entities/auth_failure.dart';
import '../../domain/entities/auth_session.dart';

enum AuthStatus { unknown, unauthenticated, authenticating, authenticated }

class AuthState extends Equatable {
  const AuthState._({required this.status, this.session, this.errorType});

  const AuthState.unknown() : this._(status: AuthStatus.unknown);

  const AuthState.unauthenticated({AuthFailureType? errorType})
    : this._(status: AuthStatus.unauthenticated, errorType: errorType);

  const AuthState.authenticating() : this._(status: AuthStatus.authenticating);

  const AuthState.authenticated(AuthSession session)
    : this._(status: AuthStatus.authenticated, session: session);

  final AuthStatus status;
  final AuthSession? session;
  final AuthFailureType? errorType;

  @override
  List<Object?> get props => <Object?>[status, session, errorType];
}

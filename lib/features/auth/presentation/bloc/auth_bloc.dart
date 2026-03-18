import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/auth_failure.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/restore_session_usecase.dart';
import '../../domain/usecases/sign_in_with_password_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RestoreSessionUseCase restoreSession,
    required SignInWithPasswordUseCase signInWithPassword,
    required LogoutUseCase logout,
  }) : _restoreSession = restoreSession,
       _signInWithPassword = signInWithPassword,
       _logout = logout,
       super(const AuthState.unknown()) {
    on<AuthAppStarted>(_onStarted);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  final RestoreSessionUseCase _restoreSession;
  final SignInWithPasswordUseCase _signInWithPassword;
  final LogoutUseCase _logout;

  Future<void> _onStarted(AuthAppStarted event, Emitter<AuthState> emit) async {
    final session = await _restoreSession();
    if (session != null) {
      emit(AuthState.authenticated(session));
      return;
    }

    emit(const AuthState.unauthenticated());
  }

  Future<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.authenticating());

    try {
      final session = await _signInWithPassword(
        email: event.email.trim(),
        password: event.password,
      );
      emit(AuthState.authenticated(session));
    } on AuthFailure catch (failure) {
      emit(AuthState.unauthenticated(errorType: failure.type));
    } catch (_) {
      emit(const AuthState.unauthenticated(errorType: AuthFailureType.unknown));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _logout();
    emit(const AuthState.unauthenticated());
  }
}

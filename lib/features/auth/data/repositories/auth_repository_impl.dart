import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required MockAuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  final MockAuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<void> logout() => _localDataSource.clearSession();

  @override
  Future<AuthSession?> restoreSession() => _localDataSource.getCachedSession();

  @override
  Future<AuthSession> signInWithPassword({
    required String email,
    required String password,
  }) async {
    final session = await _remoteDataSource.signInWithPassword(
      email: email,
      password: password,
    );
    await _localDataSource.saveSession(session);
    return session;
  }
}

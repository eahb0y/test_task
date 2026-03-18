import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/auth_failure.dart';
import '../models/auth_session_model.dart';

class MockAuthRemoteDataSource {
  Future<AuthSessionModel> signInWithPassword({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 950));

    if (email.trim().toLowerCase() != AppConstants.mockEmail ||
        password != AppConstants.mockPassword) {
      throw const AuthFailure(AuthFailureType.invalidCredentials);
    }

    final now = DateTime.now();

    return AuthSessionModel(
      token: 'mock_token_${now.millisecondsSinceEpoch}',
      email: AppConstants.mockEmail,
      userId: AppConstants.mockUserId,
      expiresAt: now.add(const Duration(days: 7)),
    );
  }
}

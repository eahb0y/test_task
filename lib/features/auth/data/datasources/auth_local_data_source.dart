import '../../../../core/storage/app_preferences.dart';
import '../models/auth_session_model.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this._preferences);

  final AppPreferences _preferences;

  Future<AuthSessionModel?> getCachedSession() async {
    final token = _preferences.token;
    final email = _preferences.email;
    final userId = _preferences.userId;
    final expiresAtMillis = _preferences.expiresAtMillis;

    if (token == null ||
        email == null ||
        userId == null ||
        expiresAtMillis == null) {
      return null;
    }

    final session = AuthSessionModel(
      token: token,
      email: email,
      userId: userId,
      expiresAt: DateTime.fromMillisecondsSinceEpoch(expiresAtMillis),
    );

    if (session.isExpired) {
      await clearSession();
      return null;
    }

    return session;
  }

  Future<void> saveSession(AuthSessionModel session) {
    return _preferences.saveSession(
      token: session.token,
      email: session.email,
      userId: session.userId,
      expiresAt: session.expiresAt,
    );
  }

  Future<void> clearSession() => _preferences.clearSession();
}

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _tokenKey = 'auth_token';
  static const String _emailKey = 'auth_email';
  static const String _userIdKey = 'auth_user_id';
  static const String _expiresAtKey = 'auth_expires_at';
  static const String _themeModeKey = 'app_theme_mode';
  static const String _localeCodeKey = 'app_locale_code';

  String? get token => _sharedPreferences.getString(_tokenKey);
  String? get email => _sharedPreferences.getString(_emailKey);
  String? get userId => _sharedPreferences.getString(_userIdKey);
  int? get expiresAtMillis => _sharedPreferences.getInt(_expiresAtKey);
  String? get themeMode => _sharedPreferences.getString(_themeModeKey);
  String? get localeCode => _sharedPreferences.getString(_localeCodeKey);

  Future<void> saveSession({
    required String token,
    required String email,
    required String userId,
    required DateTime expiresAt,
  }) async {
    await _sharedPreferences.setString(_tokenKey, token);
    await _sharedPreferences.setString(_emailKey, email);
    await _sharedPreferences.setString(_userIdKey, userId);
    await _sharedPreferences.setInt(
      _expiresAtKey,
      expiresAt.millisecondsSinceEpoch,
    );
  }

  Future<void> clearSession() async {
    await _sharedPreferences.remove(_tokenKey);
    await _sharedPreferences.remove(_emailKey);
    await _sharedPreferences.remove(_userIdKey);
    await _sharedPreferences.remove(_expiresAtKey);
  }

  Future<void> saveThemeMode(String mode) async {
    await _sharedPreferences.setString(_themeModeKey, mode);
  }

  Future<void> saveLocaleCode(String localeCode) async {
    await _sharedPreferences.setString(_localeCodeKey, localeCode);
  }
}

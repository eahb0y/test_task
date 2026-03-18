import '../../../../core/constants/app_constants.dart';
import '../../../../core/storage/app_preferences.dart';
import '../../domain/entities/app_settings.dart';

class SettingsLocalDataSource {
  SettingsLocalDataSource(this._preferences);

  final AppPreferences _preferences;

  Future<AppSettings> readSettings() async {
    return AppSettings(
      themePreference: AppThemePreferenceX.fromStorage(_preferences.themeMode),
      localeCode: _normalizeLocale(_preferences.localeCode),
    );
  }

  Future<AppSettings> updateTheme(AppThemePreference themePreference) async {
    await _preferences.saveThemeMode(themePreference.storageValue);
    return readSettings();
  }

  Future<AppSettings> updateLocale(String localeCode) async {
    final normalized = _normalizeLocale(localeCode);
    await _preferences.saveLocaleCode(normalized);
    return readSettings();
  }

  String _normalizeLocale(String? localeCode) {
    if (localeCode == null) {
      return AppConstants.defaultLocaleCode;
    }

    final isSupported = AppConstants.supportedLocales.any(
      (locale) => locale.languageCode == localeCode,
    );

    return isSupported ? localeCode : AppConstants.defaultLocaleCode;
  }
}

import '../entities/app_settings.dart';

abstract class SettingsRepository {
  Future<AppSettings> getSettings();
  Future<AppSettings> updateTheme(AppThemePreference themePreference);
  Future<AppSettings> updateLocale(String localeCode);
}

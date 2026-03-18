import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_data_source.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required SettingsLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final SettingsLocalDataSource _localDataSource;

  @override
  Future<AppSettings> getSettings() => _localDataSource.readSettings();

  @override
  Future<AppSettings> updateLocale(String localeCode) =>
      _localDataSource.updateLocale(localeCode);

  @override
  Future<AppSettings> updateTheme(AppThemePreference themePreference) =>
      _localDataSource.updateTheme(themePreference);
}

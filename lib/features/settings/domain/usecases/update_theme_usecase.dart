import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';

class UpdateThemeUseCase {
  const UpdateThemeUseCase(this._repository);

  final SettingsRepository _repository;

  Future<AppSettings> call(AppThemePreference themePreference) =>
      _repository.updateTheme(themePreference);
}

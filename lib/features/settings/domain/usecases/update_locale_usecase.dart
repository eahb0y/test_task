import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';

class UpdateLocaleUseCase {
  const UpdateLocaleUseCase(this._repository);

  final SettingsRepository _repository;

  Future<AppSettings> call(String localeCode) =>
      _repository.updateLocale(localeCode);
}

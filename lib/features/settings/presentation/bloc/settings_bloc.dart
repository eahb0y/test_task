import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_settings_usecase.dart';
import '../../domain/usecases/update_locale_usecase.dart';
import '../../domain/usecases/update_theme_usecase.dart';
import 'settings_event.dart';
import 'settings_state.dart';

export 'settings_event.dart';
export 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required GetSettingsUseCase getSettings,
    required UpdateThemeUseCase updateTheme,
    required UpdateLocaleUseCase updateLocale,
  }) : _getSettings = getSettings,
       _updateTheme = updateTheme,
       _updateLocale = updateLocale,
       super(const SettingsState.initial()) {
    on<SettingsStarted>(_onStarted);
    on<ThemePreferenceChanged>(_onThemeChanged);
    on<LocalePreferenceChanged>(_onLocaleChanged);
  }

  final GetSettingsUseCase _getSettings;
  final UpdateThemeUseCase _updateTheme;
  final UpdateLocaleUseCase _updateLocale;

  Future<void> _onStarted(
    SettingsStarted event,
    Emitter<SettingsState> emit,
  ) async {
    final settings = await _getSettings();
    emit(SettingsState.fromSettings(settings));
  }

  Future<void> _onThemeChanged(
    ThemePreferenceChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final settings = await _updateTheme(event.themePreference);
    emit(SettingsState.fromSettings(settings));
  }

  Future<void> _onLocaleChanged(
    LocalePreferenceChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final settings = await _updateLocale(event.localeCode);
    emit(SettingsState.fromSettings(settings));
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/app_settings.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.themePreference,
    required this.localeCode,
  });

  const SettingsState.initial()
    : themePreference = AppThemePreference.system,
      localeCode = 'ru';

  factory SettingsState.fromSettings(AppSettings settings) {
    return SettingsState(
      themePreference: settings.themePreference,
      localeCode: settings.localeCode,
    );
  }

  final AppThemePreference themePreference;
  final String localeCode;

  ThemeMode get themeMode => themePreference.themeMode;

  @override
  List<Object?> get props => <Object?>[themePreference, localeCode];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/localization/app_localizations.dart';
import 'package:test_task/core/util/app_utils.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/settings/domain/entities/app_settings.dart';
import 'package:test_task/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:test_task/features/settings/presentation/pages/widgets/setting_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settingsState = context.watch<SettingsBloc>().state;

    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: <Widget>[
        SettingSection(
          title: l10n.text('themeTitle'),
          subtitle: l10n.text('themeHint'),
          child: SegmentedButton<AppThemePreference>(
            showSelectedIcon: false,
            segments: <ButtonSegment<AppThemePreference>>[
              ButtonSegment<AppThemePreference>(
                value: AppThemePreference.system,
                label: Text(l10n.text('systemTheme')),
                icon: const Icon(Icons.settings_suggest_rounded),
              ),
              ButtonSegment<AppThemePreference>(
                value: AppThemePreference.light,
                label: Text(l10n.text('lightTheme')),
                icon: const Icon(Icons.light_mode_rounded),
              ),
              ButtonSegment<AppThemePreference>(
                value: AppThemePreference.dark,
                label: Text(l10n.text('darkTheme')),
                icon: const Icon(Icons.dark_mode_rounded),
              ),
            ],
            selected: <AppThemePreference>{settingsState.themePreference},
            onSelectionChanged: (selection) {
              context.read<SettingsBloc>().add(
                ThemePreferenceChanged(selection.first),
              );
            },
          ),
        ),
        AppGaps.v18,
        SettingSection(
          title: l10n.text('languageTitle'),
          subtitle: l10n.text('languageHint'),
          child: SegmentedButton<String>(
            showSelectedIcon: false,
            segments: <ButtonSegment<String>>[
              ButtonSegment<String>(
                value: 'ru',
                label: Text(l10n.text('russianLanguage')),
                icon: const Icon(Icons.translate_rounded),
              ),
              ButtonSegment<String>(
                value: 'uz',
                label: Text(l10n.text('uzbekLanguage')),
                icon: const Icon(Icons.public_rounded),
              ),
            ],
            selected: <String>{settingsState.localeCode},
            onSelectionChanged: (selection) {
              context.read<SettingsBloc>().add(
                LocalePreferenceChanged(selection.first),
              );
            },
          ),
        ),
        AppGaps.v18,
        FilledButton.tonalIcon(
          onPressed: () async {
            final shouldLogout = await _showLogoutConfirmation(context);
            if (!context.mounted || !shouldLogout) {
              return;
            }

            context.read<AuthBloc>().add(const AuthLogoutRequested());
          },
          icon: const Icon(Icons.logout_rounded),
          label: Text(l10n.text('logoutButton')),
        ),
      ],
    );
  }

  Future<bool> _showLogoutConfirmation(BuildContext context) async {
    final l10n = context.l10n;

    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.text('logoutDialogTitle')),
          content: Text(l10n.text('logoutDialogMessage')),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: Text(l10n.text('logoutCancelButton')),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: Text(l10n.text('logoutConfirmButton')),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}

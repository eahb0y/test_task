import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_task/dependency_injection.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/auth_gate/presentation/pages/auth_gate_page.dart';
import 'package:test_task/features/settings/presentation/bloc/settings_bloc.dart';

import 'core/constants/app_constants.dart';
import 'core/localization/app_localizations.dart';
import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>()..add(const AuthAppStarted()),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) =>
              getIt<SettingsBloc>()..add(const SettingsStarted()),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          locale: Locale(settingsState.localeCode),
          supportedLocales: AppConstants.supportedLocales,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: settingsState.themeMode,
          home: const AuthGatePage(),
        );
      },
    );
  }
}

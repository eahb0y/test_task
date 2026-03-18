import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_task/app.dart';
import 'package:test_task/core/constants/app_constants.dart';
import 'package:test_task/core/localization/app_localizations.dart';
import 'package:test_task/core/theme/app_theme.dart';
import 'package:test_task/dependency_injection.dart';
import 'package:test_task/core/storage/app_preferences.dart';
import 'package:test_task/core/util/app_utils.dart';
import 'package:test_task/features/auth/presentation/pages/widgets/auth_form.dart';
import 'package:test_task/features/home_shell/presentation/pages/widgets/shell_navigation_bar.dart';

void main() {
  testWidgets('shows auth flow and logs in with mock credentials', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final sharedPreferences = await SharedPreferences.getInstance();
    await setupServiceLocator(preferences: AppPreferences(sharedPreferences));

    await tester.pumpWidget(const App());

    await tester.pumpAndSettle();

    expect(find.text('Токен сохраняется локально'), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);
    expect(find.text('Apple'), findsOneWidget);

    await tester.tap(find.text('Войти'));
    await tester.pumpAndSettle();

    expect(find.text('Домашняя страница'), findsOneWidget);
    expect(find.textContaining('Amina Rakhimova'), findsOneWidget);
    expect(find.text('Atlas Cafe'), findsOneWidget);
  });

  testWidgets('shows loading inside sign in button without replacing form', (
    WidgetTester tester,
  ) async {
    final emailController = TextEditingController(text: 'demo@solidflow.app');
    final passwordController = TextEditingController(text: 'DemoPass123');

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ru'),
        supportedLocales: AppConstants.supportedLocales,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: AppTheme.lightTheme(),
        home: Scaffold(
          body: AuthForm(
            formKey: GlobalKey<FormState>(),
            emailController: emailController,
            passwordController: passwordController,
            onSubmit: _noopSubmit,
            isLoading: true,
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byKey(AuthForm.signInLoadingKey), findsOneWidget);
    expect(find.text('Войти'), findsNothing);

    final signInButton = tester.widget<FilledButton>(
      find.byKey(AuthForm.signInButtonKey),
    );
    expect(signInButton.onPressed, isNull);
  });

  testWidgets('keeps shell navigation compact with bottom inset', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.darkTheme(),
        home: MediaQuery(
          data: const MediaQueryData(
            padding: EdgeInsets.only(bottom: 34),
            viewPadding: EdgeInsets.only(bottom: 34),
          ),
          child: Scaffold(
            bottomNavigationBar: SafeArea(
              top: false,
              minimum: AppPaddings.shellNavigation,
              child: const ShellNavigationBar(
                selectedIndex: 0,
                onDestinationSelected: _noopSelect,
                homeLabel: 'Asosiy',
                settingsLabel: 'Sozlamalar',
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      tester.getSize(find.byKey(ShellNavigationBar.containerKey)).height,
      ShellNavigationBar.height,
    );
  });

  testWidgets('asks for confirmation before logout', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final sharedPreferences = await SharedPreferences.getInstance();
    await setupServiceLocator(preferences: AppPreferences(sharedPreferences));

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Войти'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1200));
    await tester.pump(const Duration(milliseconds: 1400));

    await tester.tap(find.text('Настройки'));
    await tester.pumpAndSettle();

    expect(find.text('Выйти из аккаунта'), findsOneWidget);

    await tester.tap(find.text('Выйти из аккаунта'));
    await tester.pumpAndSettle();

    expect(find.text('Выйти из аккаунта?'), findsOneWidget);
    expect(
      find.text(
        'Сохраненная сессия будет очищена, и приложение вернется на экран входа.',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Отмена'));
    await tester.pumpAndSettle();

    expect(find.text('Выйти из аккаунта?'), findsNothing);
    expect(find.text('Выйти из аккаунта'), findsOneWidget);

    await tester.tap(find.text('Выйти из аккаунта'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Выйти'));
    await tester.pumpAndSettle();

    expect(find.text('Токен сохраняется локально'), findsOneWidget);
  });
}

void _noopSelect(int _) {}

void _noopSubmit() {}

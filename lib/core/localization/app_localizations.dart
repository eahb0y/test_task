import 'package:flutter/widgets.dart';

import '../constants/app_constants.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    assert(localization != null, 'AppLocalizations not found in context.');
    return localization!;
  }

  String text(String key) {
    final code = locale.languageCode;
    return _localizedValues[code]?[key] ??
        _localizedValues[AppConstants.defaultLocaleCode]![key] ??
        key;
  }

  static const Map<String, Map<String, String>>
  _localizedValues = <String, Map<String, String>>{
    'ru': <String, String>{
      'appName': 'Solid Business',
      'signInHeadline': 'Авторизация в рабочий кабинет',
      'signInSubheadline':
          'Токен сохраняется локально, а данные профиля и бизнесов приходят из мок-сервера.',
      'emailLabel': 'Email',
      'passwordLabel': 'Пароль',
      'emailPlaceholder': 'Введите email',
      'passwordPlaceholder': 'Введите пароль',
      'signInButton': 'Войти',
      'demoCredentialsTitle': 'Мок-данные для входа',
      'demoCredentialsDescription':
          'Используй эти учетные данные для проверки логина. Все ответы сервера в приложении моковые.',
      'googleButton': 'Google',
      'appleButton': 'Apple',
      'socialLockedHint':
          'Кнопки внешней авторизации показаны для будущей интеграции, пока они недоступны.',
      'socialComingSoon': 'Скоро',
      'invalidCredentials': 'Неверный email или пароль.',
      'loadingSession': 'Проверяем сохраненную сессию',
      'dashboardTitle': 'Домашняя страница',
      'dashboardSubtitle':
          'Краткий обзор пользователя и его бизнесов с удаленного мок-сервера.',
      'businessesTitle': 'Бизнесы пользователя',
      'refreshButton': 'Обновить',
      'settingsTitle': 'Настройки',
      'logoutButton': 'Выйти из аккаунта',
      'logoutDialogTitle': 'Выйти из аккаунта?',
      'logoutDialogMessage':
          'Сохраненная сессия будет очищена, и приложение вернется на экран входа.',
      'logoutCancelButton': 'Отмена',
      'logoutConfirmButton': 'Выйти',
      'themeTitle': 'Тема',
      'languageTitle': 'Язык',
      'lightTheme': 'Светлая',
      'darkTheme': 'Темная',
      'systemTheme': 'Системная',
      'russianLanguage': 'Русский',
      'uzbekLanguage': 'O‘zbekcha',
      'mockServerTitle': 'Мок-сервер',
      'mockServerDescription':
          'Профиль, список бизнесов и сессия собраны через mock-источники данных.',
      'sessionTokenLabel': 'Токен сессии',
      'profileTitle': 'Профиль пользователя',
      'memberSinceLabel': 'С нами с',
      'locationLabel': 'Локация',
      'planLabel': 'Тариф',
      'verifiedLabel': 'Проверен',
      'businessCountLabel': 'Бизнесов',
      'monthlyRevenueLabel': 'Выручка / мес.',
      'activeProjectsLabel': 'Активных проектов',
      'teamSizeLabel': 'Команда',
      'retryButton': 'Повторить',
      'homeTab': 'Главная',
      'settingsTab': 'Настройки',
      'themeHint': 'Меняет тему приложения и сохраняется между сессиями.',
      'languageHint':
          'Переключает локализацию интерфейса между русским и узбекским.',
      'logoutHint': 'Очищает сохраненный токен и возвращает на экран входа.',
      'helloLabel': 'Здравствуйте',
      'mainWorkspaceTitle': 'Основной обзор',
      'statusActive': 'Активно',
      'businessesEmpty': 'У пользователя пока нет бизнесов.',
      'tokenSavedLabel': 'Токен сохраняется локально',
      'loadingDashboard': 'Загружаем профиль и бизнесы',
      'changeThemeLabel': 'Сменить тему',
      'changeLanguageLabel': 'Сменить язык',
      'signInMockHint':
          'Внешняя авторизация подготовлена на уровне UI, но намеренно отключена.',
      'demoServerBadge': 'Demo API',
      'mockModeBadge': 'Mock mode',
      'homeShellHint':
          'Навигация объединяет основную страницу и настройки в одном shell.',
      'authenticating': 'Подготавливаем безопасный вход',
    },
    'uz': <String, String>{
      'appName': 'Solid Business',
      'signInHeadline': 'Ish kabinetiga kirish',
      'signInSubheadline':
          'Token lokal saqlanadi, profil va biznes maʼlumotlari esa mock serverdan olinadi.',
      'emailLabel': 'Email',
      'passwordLabel': 'Parol',
      'emailPlaceholder': 'Email kiriting',
      'passwordPlaceholder': 'Parol kiriting',
      'signInButton': 'Kirish',
      'demoCredentialsTitle': 'Kirish uchun mock maʼlumotlar',
      'demoCredentialsDescription':
          'Loginni tekshirish uchun shu akkauntdan foydalaning. Ilovadagi barcha server javoblari mock koʼrinishda.',
      'googleButton': 'Google',
      'appleButton': 'Apple',
      'socialLockedHint':
          'Tashqi servislar orqali kirish tugmalari kelajak integratsiya uchun koʼrsatilgan, hozircha ishlamaydi.',
      'socialComingSoon': 'Tez orada',
      'invalidCredentials': 'Email yoki parol notoʼgʼri.',
      'loadingSession': 'Saqlangan sessiya tekshirilmoqda',
      'dashboardTitle': 'Bosh sahifa',
      'dashboardSubtitle':
          'Foydalanuvchi va uning bizneslari haqida qisqa koʼrinish mock serverdan olinadi.',
      'businessesTitle': 'Foydalanuvchi bizneslari',
      'refreshButton': 'Yangilash',
      'settingsTitle': 'Sozlamalar',
      'logoutButton': 'Akkauntdan chiqish',
      'logoutDialogTitle': 'Akkauntdan chiqilsinmi?',
      'logoutDialogMessage':
          'Saqlangan sessiya tozalanadi va ilova kirish sahifasiga qaytadi.',
      'logoutCancelButton': 'Bekor qilish',
      'logoutConfirmButton': 'Chiqish',
      'themeTitle': 'Mavzu',
      'languageTitle': 'Til',
      'lightTheme': 'Yorugʼ',
      'darkTheme': 'Qorongʼi',
      'systemTheme': 'Tizim boʼyicha',
      'russianLanguage': 'Ruscha',
      'uzbekLanguage': 'O‘zbekcha',
      'mockServerTitle': 'Mock server',
      'mockServerDescription':
          'Profil, bizneslar roʼyxati va sessiya mock data source orqali yigʼilgan.',
      'sessionTokenLabel': 'Sessiya tokeni',
      'profileTitle': 'Foydalanuvchi profili',
      'memberSinceLabel': 'Qoʼshilgan sana',
      'locationLabel': 'Joylashuv',
      'planLabel': 'Tarif',
      'verifiedLabel': 'Tasdiqlangan',
      'businessCountLabel': 'Bizneslar',
      'monthlyRevenueLabel': 'Oy daromadi',
      'activeProjectsLabel': 'Faol loyihalar',
      'teamSizeLabel': 'Jamoa',
      'retryButton': 'Qayta urinish',
      'homeTab': 'Asosiy',
      'settingsTab': 'Sozlamalar',
      'themeHint':
          'Ilova mavzusini almashtiradi va keyingi sessiyada saqlanadi.',
      'languageHint':
          'Interfeys tilini ruscha va o‘zbekcha o‘rtasida almashtiradi.',
      'logoutHint': 'Saqlangan tokenni tozalab, kirish sahifasiga qaytaradi.',
      'helloLabel': 'Salom',
      'mainWorkspaceTitle': 'Asosiy ko‘rinish',
      'statusActive': 'Faol',
      'businessesEmpty': 'Foydalanuvchida hozircha biznes yoʼq.',
      'tokenSavedLabel': 'Token lokal saqlanadi',
      'loadingDashboard': 'Profil va bizneslar yuklanmoqda',
      'changeThemeLabel': 'Mavzuni o‘zgartirish',
      'changeLanguageLabel': 'Tilni o‘zgartirish',
      'signInMockHint':
          'Tashqi avtorizatsiya UI darajasida tayyorlangan, ammo ataylab o‘chirilgan.',
      'demoServerBadge': 'Demo API',
      'mockModeBadge': 'Mock rejim',
      'homeShellHint':
          'Navigatsiya asosiy sahifa va sozlamalarni bitta shell ichida birlashtiradi.',
      'authenticating': 'Xavfsiz kirish tayyorlanmoqda',
    },
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppConstants.supportedLocales.any(
    (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
  );

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension AppLocalizationContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

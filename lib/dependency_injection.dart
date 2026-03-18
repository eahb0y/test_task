import 'package:get_it/get_it.dart';
import 'package:test_task/core/storage/app_preferences.dart';
import 'package:test_task/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:test_task/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:test_task/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:test_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:test_task/features/auth/domain/usecases/logout_usecase.dart';
import 'package:test_task/features/auth/domain/usecases/restore_session_usecase.dart';
import 'package:test_task/features/auth/domain/usecases/sign_in_with_password_usecase.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:test_task/features/home/data/repositories/home_repository_impl.dart';
import 'package:test_task/features/home/domain/repositories/home_repository.dart';
import 'package:test_task/features/home/domain/usecases/get_dashboard_usecase.dart';
import 'package:test_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:test_task/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:test_task/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:test_task/features/settings/domain/repositories/settings_repository.dart';
import 'package:test_task/features/settings/domain/usecases/get_settings_usecase.dart';
import 'package:test_task/features/settings/domain/usecases/update_locale_usecase.dart';
import 'package:test_task/features/settings/domain/usecases/update_theme_usecase.dart';
import 'package:test_task/features/settings/presentation/bloc/settings_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator({required AppPreferences preferences}) async {
  await getIt.reset();

  getIt.registerSingleton<AppPreferences>(preferences);

  getIt
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(getIt<AppPreferences>()),
    )
    ..registerLazySingleton<MockAuthRemoteDataSource>(
      MockAuthRemoteDataSource.new,
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: getIt<MockAuthRemoteDataSource>(),
        localDataSource: getIt<AuthLocalDataSource>(),
      ),
    )
    ..registerLazySingleton<RestoreSessionUseCase>(
      () => RestoreSessionUseCase(getIt<AuthRepository>()),
    )
    ..registerLazySingleton<SignInWithPasswordUseCase>(
      () => SignInWithPasswordUseCase(getIt<AuthRepository>()),
    )
    ..registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(getIt<AuthRepository>()),
    )
    ..registerFactory<AuthBloc>(
      () => AuthBloc(
        restoreSession: getIt<RestoreSessionUseCase>(),
        signInWithPassword: getIt<SignInWithPasswordUseCase>(),
        logout: getIt<LogoutUseCase>(),
      ),
    )
    ..registerLazySingleton<MockHomeRemoteDataSource>(
      MockHomeRemoteDataSource.new,
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDataSource: getIt<MockHomeRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton<GetDashboardUseCase>(
      () => GetDashboardUseCase(getIt<HomeRepository>()),
    )
    ..registerFactoryParam<HomeBloc, String, void>(
      (token, _) =>
          HomeBloc(getDashboard: getIt<GetDashboardUseCase>(), token: token),
    )
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSource(getIt<AppPreferences>()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        localDataSource: getIt<SettingsLocalDataSource>(),
      ),
    )
    ..registerLazySingleton<GetSettingsUseCase>(
      () => GetSettingsUseCase(getIt<SettingsRepository>()),
    )
    ..registerLazySingleton<UpdateThemeUseCase>(
      () => UpdateThemeUseCase(getIt<SettingsRepository>()),
    )
    ..registerLazySingleton<UpdateLocaleUseCase>(
      () => UpdateLocaleUseCase(getIt<SettingsRepository>()),
    )
    ..registerFactory<SettingsBloc>(
      () => SettingsBloc(
        getSettings: getIt<GetSettingsUseCase>(),
        updateTheme: getIt<UpdateThemeUseCase>(),
        updateLocale: getIt<UpdateLocaleUseCase>(),
      ),
    );
}

part of 'init_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  ///register secure storage
  sl.registerLazySingleton(() => SecureStorageService());

  ///register shared preferences
  final sharedPrefService = SharedPrefService();
  await sharedPrefService.init();
  sl.registerLazySingleton<SharedPrefService>(() => sharedPrefService);

  /// Internet Checker
  sl.registerLazySingleton(() => InternetConnection());

  /// rejister Connection Checker
  sl.registerLazySingleton<ConnectionChecker>(
    () => ConnectionCheckerImpl(sl()),
  );

  /// Api Client (Singleton with Toast access etc.)
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: ApiEndpoint.baseUrl,
      onLogout: () async {
        // Clean up on logout
        await sl<SecureStorageService>().deleteAll();
        await sl<SharedPrefService>().clear();

        AppRoute.router.goNamed(RoutePath.loginPage);
      },
      getToken: () {
        return sl<SecureStorageService>().read(SecureKeys.accessToken);
      },
    ),
  );

  ///don't remove this comment

  await ProfileInjector.init(); // registers Profile feature

  await ChatInjector.init(); // registers Chat feature
  // registers Attendance feature

  await HomeInjector.init(); // registers Home feature

  await MainInjector.init(); // registers Main feature

}

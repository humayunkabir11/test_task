import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/routes/app_route.dart';
import 'core/config/strings/app_constants.dart';
import 'core/config/strings/app_strings.dart';
import 'core/config/theme/app_theme.dart';
import 'core/di/init_dependencies.dart';
import 'core/utils/dev_log.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/chat/presentation/bloc/chat_bloc.dart';
import 'global.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      await Global.init(); // ✅ Initialize global setup

      runApp(
        EasyLocalization(
          supportedLocales: AppConstants.supportedLocales.values.toList(),
          path: AppConstants.translationPath,
          fallbackLocale: AppConstants.fallbackLocale,
          child: DevicePreview(
            enabled: false,
            tools: const [...DevicePreview.defaultTools],
            builder: (context) => const MyApp(),
          ),
        ),
      );
    },
    (error, stackTrace) {
      // ✅ Log errors globally
      devLog(
        tag: "APPLICATION-ERROR",
        payload: {"error": "$error", "stackTrace": "$stackTrace"},
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: false,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: sl<AuthBloc>()),
            BlocProvider.value(value: sl<ChatBloc>()),
          ],
          child: MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp.router(
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: AppTheme.lightTheme,
              themeMode: ThemeMode.light,

              // ✅ Easy Localization integration
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,

              // ✅ Routing setup
              routeInformationParser: AppRoute.router.routeInformationParser,
              routerDelegate: AppRoute.router.routerDelegate,
              routeInformationProvider:
                  AppRoute.router.routeInformationProvider,
            ),
          ),
        );
      },
    );
  }
}

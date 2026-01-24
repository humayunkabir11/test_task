import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing/features/home/presentation/bloc/home_bloc.dart';

import 'core/config/routes/app_route.dart';
import 'core/config/strings/app_strings.dart';
import 'core/config/theme/app_theme.dart';
import 'core/di/init_dependencies.dart';
import 'core/utils/dev_log.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies(); // ✅ VERY IMPORTANT

  await runZonedGuarded<Future<void>>(
        () async {
      runApp(
        DevicePreview(
          enabled: false,
          tools: const [...DevicePreview.defaultTools],
          builder: (context) => const MyApp(),
        ),
      );
    },
        (error, stackTrace) {
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
      designSize: const Size(375, 812),
      minTextAdapt: false,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: sl<HomeBloc>()),
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
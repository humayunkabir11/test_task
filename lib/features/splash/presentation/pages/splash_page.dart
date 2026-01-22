import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testing/core/config/routes/app_route.dart';


import '../../../../core/config/routes/route_path.dart';
import '../../../../core/di/init_dependencies.dart';
import '../../../../core/storage/secure_keys.dart';
import '../../../../core/storage/secure_storage_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      AppRoute.router.goNamed(RoutePath.mainPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/splash.png")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testing/features/home/presentation/pages/product_details_page.dart';
import '../../../features/attendance/presentation/pages/attendance_page.dart';
import '../../../features/auth/presentation/pages/auth_page.dart';
import '../../../features/auth/presentation/pages/role/select_role_page.dart';
import '../../../features/chat/presentation/pages/chat_page.dart';
import '../../../features/chat/presentation/pages/message_page.dart';
import '../../../features/home/presentation/pages/all_product_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/main/presentation/pages/main_page.dart';
import '../../../features/profile/presentation/pages/profile_page.dart';
import '../../../features/splash/presentation/pages/splash_page.dart';
import 'route_path.dart';

class AppRoute {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _homeNavigatorKey = GlobalKey<NavigatorState>();
  static final _attendanceNavigatorKey = GlobalKey<NavigatorState>();
  static final _chatNavigatorKey = GlobalKey<NavigatorState>();
  static final _profileNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _routerX = GoRouter(
    initialLocation: RoutePath.splashPagePath,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RoutePath.splashPage,
        path: RoutePath.splashPagePath,
        builder: (context, state) => SplashPage(),
      ),

      //message route
      GoRoute(
        name: RoutePath.messagePage,
        path: RoutePath.messagePagePath,
        builder: (context, state) => MessagePage(),
      ),

      //select role route
      GoRoute(
        name: RoutePath.selectRolePage,
        path: RoutePath.selectRolePagePath,
        builder: (context, state) => SelectRolePage(),
      ),

      GoRoute(
        name: RoutePath.productDetailsPage,
        path: RoutePath.productDetailsPagePath,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: ProductDetailsPage()),
      ),
      //select role route
      GoRoute(
        name: RoutePath.allProductPage,
        path: RoutePath.allProductPagePath,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: AllProductPage()),
      ),

      // ///main page route
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          ///Home branch
          StatefulShellBranch(
            initialLocation: RoutePath.mainPagePath,
            navigatorKey: _homeNavigatorKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: RoutePath.mainPage,
                path: RoutePath.mainPagePath,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: HomePage()),
                routes: [

                ]
              ),

            ],
          ),

          ///Attendance branch
          StatefulShellBranch(
            initialLocation: RoutePath.attendancePagePath,
            navigatorKey: _attendanceNavigatorKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: RoutePath.attendancePage,
                path: RoutePath.attendancePagePath,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: Message()),
              ),
            ],
          ),

          ///Chat branch
          StatefulShellBranch(
            initialLocation: RoutePath.chatPagePath,
            navigatorKey: _chatNavigatorKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: RoutePath.chatPage,
                path: RoutePath.chatPagePath,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: Message()),
              ),
            ],
          ),

          ///Profile branch
          StatefulShellBranch(
            initialLocation: RoutePath.profilePagePath,
            navigatorKey: _profileNavigatorKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: RoutePath.profilePage,
                path: RoutePath.profilePagePath,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text("Something went wrong"))),
  );

  static GoRouter get router => _routerX;
}

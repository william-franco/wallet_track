import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_track/src/features/home/views/home_view.dart';
import 'package:wallet_track/src/features/settings/views/setting_view.dart';

final routesApp = Routes();

class Routes {
  static const String home = '/';
  static const String settings = '/settings';

  final routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeView(),
        ),
      ),
      GoRoute(
        path: settings,
        pageBuilder: (context, state) => const MaterialPage(
          child: SettingView(),
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wallet_track/src/dependency_injector/dependency_injector.dart';
import 'package:wallet_track/src/features/settings/view_models/setting_view_model.dart';
import 'package:wallet_track/src/routes/routes.dart';

void main() {
  runApp(
    const DependencyInjector(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<SettingViewModel>().value;
    return MaterialApp.router(
      title: 'Wallet Track',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'PT'),
      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.indigo[600],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.indigo[600],
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      routerConfig: routesApp.routes,
    );
  }
}

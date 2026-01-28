import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/theme_provider.dart' as custom;
import '../Theme/theme.dart';
import '../utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    return MaterialApp.router(
      title: 'Jobs.af',
      themeMode: themeProvider.isdarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

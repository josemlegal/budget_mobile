import 'package:budgetkp/core/dependency_injection/locator.dart';
import 'package:budgetkp/core/router/router.dart';
import 'package:budgetkp/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'presentation/settings/controllers/settings_controller.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
  setupLocator();
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      themeMode: appTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Itti App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}

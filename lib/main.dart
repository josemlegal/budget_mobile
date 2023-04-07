import 'package:budgetkp/core/dependency_injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:budgetkp/core/router/router.dart' as router;
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  setupLocator();

  final container = ProviderContainer();
  runApp(
    UncontrolledProviderScope(container: container, child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget App',
      initialRoute: router.Router.homeView,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}

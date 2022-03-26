import 'package:flutter/material.dart';
import 'package:website/services/services.dart';
import 'package:website/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seed = AppTheme.randomSeed();
    return MaterialApp.router(
      title: 'xip',
      theme: AppTheme.light(seed),
      darkTheme: AppTheme.dark(seed),
      themeMode: ThemeMode.system,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}

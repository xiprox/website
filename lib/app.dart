import 'package:flutter/material.dart';
import 'package:website/services/services.dart';
import 'package:website/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'İI',
      theme: AppTheme.dark(),
      darkTheme: AppTheme.dark(),
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}

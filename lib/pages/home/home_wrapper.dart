import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';
import 'package:website/pages/home/home_vm.dart';

import 'home_page.dart';

@RoutePage()
class HomeWrapper extends StatelessWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: const HomePage(),
    );
  }
}

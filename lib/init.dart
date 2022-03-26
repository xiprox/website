import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:veee/veee.dart';
import 'package:website/services/services.dart';
import 'package:website/widgets/player/player_vm.dart';

import 'app.dart';

Future init() async {
  await Executor().warmUp(log: kDebugMode);
  await Services.init();
  setPathUrlStrategy();
  runApp(const _Providers(App()));
}

class _Providers extends StatelessWidget {
  final Widget child;
  const _Providers(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PlayerViewModel>(
      create: (_) => PlayerViewModel(),
      child: child,
    );
  }
}

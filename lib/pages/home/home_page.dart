import 'package:flutter/material.dart';
import 'package:veee/veee.dart';
import 'package:website/widgets/player/mini_player/mini_player.dart';

import 'home_content.dart';
import 'home_vm.dart';

class HomePage extends ViewModelWidget<HomeViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel vm) {
    return const Scaffold(
      body: Stack(
        children: [
          HomeContent(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: MiniPlayer(),
            ),
          ),
        ],
      ),
    );
  }
}

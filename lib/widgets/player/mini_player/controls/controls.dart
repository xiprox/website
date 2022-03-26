import 'package:flutter/material.dart';
import 'package:veee/veee.dart';
import 'package:website/widgets/player/player_vm.dart';

import 'next.dart';
import 'play_pause.dart';

class Controls extends ViewModelWidget<PlayerViewModel> {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel vm) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [],
    );
  }
}

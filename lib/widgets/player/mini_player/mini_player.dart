import 'package:flutter/material.dart';
import 'package:veee/veee.dart';
import 'package:website/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:website/widgets/player/player_vm.dart';

class MiniPlayer extends ViewModelWidget<PlayerViewModel> {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel vm) {
    return Material(
      color: Colors.black,
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // NetworkImageWithPlaceholder.track(),
          ],
        ),
      ),
    );
  }
}

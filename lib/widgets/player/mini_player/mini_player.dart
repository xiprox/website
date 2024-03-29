import 'package:flutter/material.dart';
import 'package:veee/veee.dart';
import 'package:website/utils/exts/all.dart';
import 'package:website/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:website/widgets/player/player_vm.dart';

import 'controls/next.dart';
import 'controls/play_pause.dart';
import 'info/track_info.dart';

class MiniPlayer extends ViewModelWidget<PlayerViewModel> {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel vm) {
    final isLightTheme = context.theme.brightness == Brightness.light;
    final colors = context.colors;
    final shadowColor =
        isLightTheme ? colors.shadow.withOpacity(0.5) : colors.shadow;
    return Material(
      color: colors.background,
      elevation: 16,
      borderRadius: BorderRadius.circular(8),
      shadowColor: shadowColor,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        alignment: AlignmentDirectional.bottomEnd,
        curve: Curves.fastOutSlowIn,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Builder(builder: (context) {
            if (vm.tracks!.isError()) {
              return const SizedBox.shrink();
            }
            if (vm.tracks!.isLoading()) {
              return const SizedBox(
                width: 8,
                height: 8,
                child: CircularProgressIndicator(strokeWidth: 1),
              );
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NetworkImageWithPlaceholder.track(
                  vm.currentTrack?.albumArtSmall ??
                      vm.currentTrack?.albumArtLarge,
                  size: 60,
                ),
                Flexible(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                    alignment: AlignmentDirectional.centerStart,
                    curve: Curves.fastOutSlowIn,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TrackInfo(
                        track: vm.currentTrack!,
                        onSongPress: vm.onSongPress,
                        onAlbumPress: vm.onAlbumPress,
                        onArtistPress: vm.onArtistPress,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: PlayPauseButton(
                    playing: vm.isPlaying,
                    onPress: vm.onPlayPausePress,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: NextButton(
                    position: vm.position,
                    duration: vm.duration ?? const Duration(seconds: 30),
                    onPress: vm.onNextPress,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            );
          }),
        ),
      ),
    );
  }
}

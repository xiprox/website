import 'package:flutter/material.dart';
import 'package:website/data/models/track.dart';

import 'album_line.dart';
import 'artist_line.dart';
import 'song_line.dart';

class TrackInfo extends StatelessWidget {
  final Track track;
  final Function()? onSongPress;
  final Function()? onAlbumPress;
  final Function()? onArtistPress;

  const TrackInfo({
    Key? key,
    required this.track,
    this.onSongPress,
    this.onAlbumPress,
    this.onArtistPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      key: ValueKey(track.name),
      curve: Curves.easeOutCubic,
      builder: (context, double animation, child) {
        return Opacity(
          opacity: animation,
          child: child,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SongLine(
            name: track.name,
            onPress: onSongPress,
          ),
          AlbumLine(
            name: track.albumName,
            url: track.albumExternalUrl,
            onPress: onAlbumPress,
          ),
          ArtistLine(
            name: track.artistName,
            onPress: onArtistPress,
          ),
        ],
      ),
    );
  }
}

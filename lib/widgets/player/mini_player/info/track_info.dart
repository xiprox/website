import 'package:flutter/material.dart';
import 'package:website/data/models/track.dart';

import 'album_line.dart';
import 'artist_line.dart';
import 'song_line.dart';

class TrackInfo extends StatelessWidget {
  final Track track;

  const TrackInfo({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      key: ValueKey(track.name),
      curve: Curves.easeOutCubic,
      builder: (context, double animation, child) {
        return Opacity(
          opacity: animation,
          child: Transform.translate(
            offset: Tween(begin: const Offset(0.0, -2), end: Offset.zero)
                .transform(animation),
            child: child,
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SongLine(name: track.name),
          AlbumLine(name: track.albumName, url: track.albumExternalUrl),
          ArtistLine(name: track.artistName),
        ],
      ),
    );
  }
}

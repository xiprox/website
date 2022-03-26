import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/utils/exts/all.dart';

class AlbumLine extends StatelessWidget {
  final String? name;
  final String? url;

  const AlbumLine({
    Key? key,
    this.name,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text.rich(
      TextSpan(
        text: 'on ',
        style: TextStyle(
          color: colors.secondary.withOpacity(0.6),
        ),
        children: [
          TextSpan(
            text: name,
            style: TextStyle(color: colors.secondary),
          ),
        ],
      ),
      overflow: TextOverflow.clip,
      maxLines: 1,
    );
  }
}

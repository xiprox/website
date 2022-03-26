import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';

class ArtistLine extends StatelessWidget {
  final String? name;

  const ArtistLine({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text.rich(
      TextSpan(
        text: 'by ',
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

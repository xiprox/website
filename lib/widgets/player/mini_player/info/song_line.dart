import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';

class SongLine extends StatelessWidget {
  final String? name;

  const SongLine({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      name ?? '?',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.secondary,
      ),
      overflow: TextOverflow.clip,
      maxLines: 1,
    );
  }
}

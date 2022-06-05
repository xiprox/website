import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';
import 'package:website/widgets/link_text_builder/link_text_builder.dart';

class SongLine extends StatelessWidget {
  final String? name;
  final Function()? onPress;

  const SongLine({
    Key? key,
    this.name,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return LinkTextBuilder(
      onPress: onPress,
      builder: (context, hoverStyle) {
        return Text(
          name ?? '?',
          overflow: TextOverflow.clip,
          maxLines: 1,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: hoverStyle.color ?? colors.secondary,
          ),
        );
      },
    );
  }
}

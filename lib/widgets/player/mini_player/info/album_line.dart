import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';
import 'package:website/widgets/link_text_builder/link_text_builder.dart';

class AlbumLine extends StatelessWidget {
  final String? name;
  final String? url;
  final Function()? onPress;

  const AlbumLine({
    Key? key,
    this.name,
    this.url,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return LinkTextBuilder(
      onPress: onPress,
      builder: (context, hoverStyle) {
        return Text.rich(
          TextSpan(
            text: 'on ',
            style: TextStyle(
              color: colors.secondary.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: name,
                style: TextStyle(color: hoverStyle.color ?? colors.secondary),
              ),
            ],
          ),
          overflow: TextOverflow.clip,
          maxLines: 1,
        );
      },
    );
  }
}

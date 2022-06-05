import 'package:flutter/material.dart';
import 'package:website/utils/exts/build_context_exts.dart';
import 'package:website/widgets/hover_builder/hover_builder.dart';

typedef LinkTextBuilderFunction = Widget Function(
  BuildContext context,
  TextStyle hoverStyle,
);

class LinkTextBuilder extends StatelessWidget {
  final LinkTextBuilderFunction builder;
  final Function()? onPress;

  const LinkTextBuilder({
    Key? key,
    required this.builder,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          onPress != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onPress,
        child: HoverBuilder(
          builder: (context, hovering) {
            final style = TextStyle(
              color:
                  onPress != null && hovering ? context.colors.primary : null,
            );
            return builder(context, style);
          },
        ),
      ),
    );
  }
}

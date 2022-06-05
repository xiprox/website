import 'package:flutter/material.dart';

typedef HoverBuilderFunction = Widget Function(
  BuildContext context,
  bool hovering,
);

class HoverBuilder extends StatefulWidget {
  final HoverBuilderFunction builder;
  final Function? onEnter;
  final Function? onExit;

  const HoverBuilder({
    Key? key,
    required this.builder,
    this.onEnter,
    this.onExit,
  }) : super(key: key);

  @override
  State<HoverBuilder> createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<HoverBuilder> {
  bool hovering = false;

  _setHovering(bool hover) {
    setState(() => hovering = hover);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        widget.onEnter?.call();
        _setHovering(true);
      },
      onExit: (e) {
        widget.onExit?.call();
        _setHovering(false);
      },
      hitTestBehavior: HitTestBehavior.translucent,
      child: widget.builder(context, hovering),
    );
  }
}

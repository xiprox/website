import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';

class PlayPauseButton extends StatefulWidget {
  final bool playing;
  final Function() onPress;

  const PlayPauseButton({
    Key? key,
    required this.playing,
    required this.onPress,
  }) : super(key: key);

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void initState() {
    super.initState();
    // _syncAnimation(widget.playing);
  }

  @override
  void didUpdateWidget(covariant PlayPauseButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.playing != widget.playing) {
      _syncAnimation(widget.playing);
    }
  }

  void _syncAnimation(bool playing) {
    if (playing) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = colors.secondary;
    final borderRadius = BorderRadius.circular(100);
    return Material(
      borderRadius: borderRadius,
      color: color.withOpacity(0.05),
      child: InkWell(
        onTap: widget.onPress,
        borderRadius: borderRadius,
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.2),
        focusColor: color.withOpacity(0.2),
        hoverColor: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _controller,
            color: color,
            size: 24,
          ),
        ),
      ),
    );
  }
}

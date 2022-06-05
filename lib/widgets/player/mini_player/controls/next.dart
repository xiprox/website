import 'dart:math';

import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';

class NextButton extends StatelessWidget {
  final Stream<Duration> position;
  final Duration duration;
  final Function() onPress;

  const NextButton({
    Key? key,
    required this.position,
    required this.duration,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = colors.tertiary;
    final inkColor = color.withOpacity(0.2);
    return Stack(
      children: [
        Material(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(100),
          child: InkWell(
            onTap: onPress,
            borderRadius: BorderRadius.circular(100),
            splashColor: inkColor,
            highlightColor: inkColor,
            focusColor: inkColor,
            hoverColor: colors.tertiary.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.skip_next_rounded,
                color: color,
                size: 24,
              ),
            ),
          ),
        ),
        StreamBuilder<Duration>(
          stream: position,
          initialData: const Duration(seconds: 1),
          builder: (context, snapshot) {
            final position = snapshot.data!;
            final seconds = position.inMilliseconds;
            final total = duration;
            final percent = seconds / total.inMilliseconds;
            return Positioned.fill(
              child: IgnorePointer(
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                      startAngle: 0,
                      endAngle: 3 * pi * (1 - percent),
                      stops: const [0.7, 0.7],
                      // 0.0 , 0.5 , 0.5 , 1.0
                      center: Alignment.center,
                      colors: [color, Colors.transparent],
                    ).createShader(rect);
                  },
                  child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                        color: color,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

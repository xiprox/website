import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.mediaQuery.size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello',
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.w600,
              color: colors.primary,
            ),
          ),
          Text(
            ' İhsan here. This is my playground on the internet I guess.',
            style: TextStyle(
              // fontWeight: FontWeight.w600,
              color: colors.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            ' Being built with Flutter whenever I feel like it.',
            style: TextStyle(
              fontSize: 10,
              color: colors.onSurfaceVariant.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

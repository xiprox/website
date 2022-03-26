import 'package:flutter/material.dart';
import 'package:website/utils/exts/all.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.mediaQuery.size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Hello',
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.w600,
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

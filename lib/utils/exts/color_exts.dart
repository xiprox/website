import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExts on Color {
  Color manipulate(double factor) {
    return Color.fromARGB(
      alpha,
      min(red * factor, 255).round(),
      min(green * factor, 255).round(),
      min(blue * factor, 255).round(),
    );
  }
}

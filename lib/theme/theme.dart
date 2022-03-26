import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() => make(Brightness.light);

  static ThemeData dark() => make(Brightness.dark);

  static ThemeData make(Brightness brightness) {
    final theme = ThemeData(brightness: brightness);
    final textTheme = GoogleFonts.nunitoTextTheme();
    final colors = ColorScheme.fromSeed(
      seedColor: _randomSeed(),
      brightness: brightness,
    );
    return theme.copyWith(
      colorScheme: colors,
      backgroundColor: colors.background,
      scaffoldBackgroundColor: colors.surfaceVariant,
      textTheme: textTheme,
    );
  }

  static Color _randomSeed() {
    const options = [
      Colors.red,
      Colors.pinkAccent,
      Colors.purpleAccent,
      Colors.deepPurpleAccent,
      Colors.indigoAccent,
      Colors.blueAccent,
      Colors.lightBlue,
      Colors.teal,
      Colors.lightGreenAccent,
      Colors.amber,
      Colors.orange,
      Colors.brown,
      Colors.blueGrey,
    ];
    return options[Random().nextInt(options.length)];
  }
}

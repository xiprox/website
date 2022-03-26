import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light(Color seed) => make(Brightness.light, seed);

  static ThemeData dark(Color seed) => make(Brightness.dark, seed);

  static ThemeData make(Brightness brightness, Color seed) {
    final theme = ThemeData(brightness: brightness);
    final textTheme = GoogleFonts.nunitoTextTheme();
    final colors = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    );
    return theme.copyWith(
      colorScheme: colors,
      backgroundColor: colors.background,
      scaffoldBackgroundColor: colors.surfaceVariant,
      textTheme: textTheme,
    );
  }

  static Color randomSeed() {
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

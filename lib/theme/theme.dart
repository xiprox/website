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
      Colors.redAccent,
      Colors.pink,
      Colors.pinkAccent,
      Colors.purple,
      Colors.purpleAccent,
      Colors.deepPurple,
      Colors.deepPurpleAccent,
      Colors.indigo,
      Colors.indigoAccent,
      Colors.blue,
      Colors.blueAccent,
      Colors.lightBlue,
      Colors.lightBlueAccent,
      Colors.cyan,
      Colors.cyanAccent,
      Colors.teal,
      Colors.tealAccent,
      Colors.green,
      Colors.greenAccent,
      Colors.lightGreen,
      Colors.lightGreenAccent,
      Colors.lime,
      Colors.limeAccent,
      Colors.yellow,
      Colors.yellowAccent,
      Colors.amber,
      Colors.amberAccent,
      Colors.orange,
      Colors.orangeAccent,
      Colors.deepOrange,
      Colors.deepOrangeAccent,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
    ];
    return options[Random().nextInt(options.length)];
  }
}

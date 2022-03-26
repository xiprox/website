import 'package:flutter/material.dart';

extension BuildContextExts on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ColorScheme get colors => theme.colorScheme;
}

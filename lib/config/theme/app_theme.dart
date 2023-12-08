import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C1441);
List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.amber,
  Colors.yellow,
  Colors.pink,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must beetwen 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.dark,
    );
  }
}

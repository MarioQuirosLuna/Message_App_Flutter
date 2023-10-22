import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFA904C6);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.redAccent,
  Colors.yellowAccent,
  Colors.pinkAccent,
  Colors.cyanAccent,
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'Invalid color index, must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark, //Apply dark theme
    );
  }
}
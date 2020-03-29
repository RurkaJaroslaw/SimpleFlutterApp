import 'package:flutter/material.dart';

class Themes {
  static const NORMAL_THEME_CODE = 0;
  static const LIGHT_THEME_CODE = 1;

  static final _normal = ThemeData(
    primarySwatch: Colors.blueGrey,
    accentColor: Colors.white,
  );

  static final _light = ThemeData(
    primarySwatch: MaterialColor(
      Colors.white.value,
      const <int, Color>{
        50: Colors.white10,
        100: Colors.white12,
        200: Colors.white24,
        300: Colors.white30,
        500: Colors.white54,
        700: Colors.white70,
      },
    ),
    accentColor: Colors.blue,
  );

  static ThemeData getTheme(int code) {
    if(code == LIGHT_THEME_CODE){
      return _light;
    }
    return _normal;
  }

}

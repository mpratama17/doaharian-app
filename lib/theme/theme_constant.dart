//create themedata
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffce5641), //10%
      100: const Color(0xffb74c3a), //20%
      200: const Color(0xffa04332), //30%
      300: const Color(0xff89392b), //40%
      400: const Color(0xff733024), //50%
      500: const Color(0xff5c261d), //60%
      600: const Color(0xff451c16), //70%
      700: const Color(0xff2e130e), //80%
      800: const Color(0xff170907), //90%
      900: const Color(0xff000000), //100%
    },
  );
} //

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  // accentColor: Colors.pink,
  // scaffoldBackgroundColor: Colors.cyan);
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  // accentColor: Colors.pink,
  scaffoldBackgroundColor: Color(0xFF635985),
  //create dark theme for elevatedbutton
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.indigo,
      onPrimary: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

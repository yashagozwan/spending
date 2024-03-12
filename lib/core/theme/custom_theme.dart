import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CustomTheme {
  static MaterialColor _getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

  static MaterialColor get primary =>
      _getMaterialColor(const Color(0xFFBF8256));

  static MaterialColor get secondary =>
      _getMaterialColor(const Color(0xFF3F0F33));

  ThemeData get light {
    final theme = ThemeData(primarySwatch: primary, fontFamily: 'Poppins');

    const rounded = 14.0;
    const edgeInsets = EdgeInsets.symmetric(vertical: 10, horizontal: 16);

    final elevatedButtonThemeData = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: edgeInsets,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(rounded),
          ),
        ),
      ),
    );

    final outlinedButtonThemeData = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        padding: edgeInsets,
        side: BorderSide(color: theme.primaryColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(rounded),
          ),
        ),
      ),
    );

    final textButtonThemeData = TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rounded),
        ),
      ),
    );

    final borderRadius = BorderRadius.circular(rounded);

    final inputDecorationTheme = InputDecorationTheme(
      contentPadding: edgeInsets.copyWith(top: 16, bottom: 16),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: borderRadius,
      ),
    );

    final dialogTheme = DialogTheme(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(rounded + 10),
    ));

    return theme.copyWith(
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      inputDecorationTheme: inputDecorationTheme,
      dialogTheme: dialogTheme,
    );
  }
}

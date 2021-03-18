import 'package:flutter/material.dart';

import 'ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey,
      ),
    ),
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText2: base.bodyText2.copyWith(
          // fontFamily: 'Lobster',
          fontSize: 16,
          color: Colors.white,
        ),
        button: base.button.copyWith(
          // fontFamily: 'Lobster',
          letterSpacing: 3.0,
        ),
      )
      .apply(
        fontFamily: 'Lobster',
      );
}

void main() => runApp(
      MaterialApp(
        home: TrulseApp(),
        theme: _appTheme,
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: Colors.grey[800],
        //   textTheme: TextTheme(
        //     headline5: TextStyle(
        //       fontSize: 34,
        //       fontWeight: FontWeight.bold,
        //     ),
        //     bodyText2: TextStyle(
        //       fontSize: 16,
        //       color: Colors.white,
        //     ),
        //   ),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       primary: Colors.blueGrey,
        //     ),
        //   ),
        // ),
      ),
    );

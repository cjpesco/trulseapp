import 'package:flutter/material.dart';

import 'ui/home.dart';

void main() => runApp(
      MaterialApp(
        home: TrulseApp(),
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );

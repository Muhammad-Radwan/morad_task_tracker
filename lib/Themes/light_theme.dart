import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        accentColor: Colors.grey,
        cardColor: Colors.white,
        errorColor: Colors.red),
    scaffoldBackgroundColor: Colors.white);

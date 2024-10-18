import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.orange,
      accentColor: Colors.grey,
      cardColor: Colors.grey,
      errorColor: Colors.red),
  scaffoldBackgroundColor: Colors.grey[900],
);

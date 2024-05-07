import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
      textTheme: TextTheme(
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
  ));
}

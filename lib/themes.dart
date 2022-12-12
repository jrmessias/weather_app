import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: "Poppins",
  disabledColor: Colors.green,
  primaryColor: Colors.grey[900],
  secondaryHeaderColor: Colors.grey[500],
  backgroundColor: Colors.grey[100],
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: Colors.grey,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
);

var darkThemeData = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  fontFamily: "Poppins",
  disabledColor: Colors.green,
  primaryColor: Colors.grey[100],
  secondaryHeaderColor: Colors.grey[500],
  backgroundColor: Colors.grey[900],
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
);

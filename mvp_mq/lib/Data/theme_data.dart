import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFEFAAC4),  
  colorScheme: ColorScheme.light(
    primary: const Color(0xFFEFAAC4),
    secondary: Colors.pink[200]!,
    onPrimary: Colors.black,  
    onSecondary: Colors.black,
    surface: Colors.pink[50]!,
    background: Colors.pink[50]!,
    error: Colors.red[300]!,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFEFAAC4),
    foregroundColor: Colors.black,  
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.pinkAccent,
    foregroundColor: Colors.black,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black, backgroundColor: const Color(0xFFEFAAC4),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.black),  
    bodyLarge: TextStyle(color: Colors.black),  
    bodyMedium: TextStyle(color: Colors.black),  
  ),
   
  buttonTheme:const ButtonThemeData(
    buttonColor: Color(0xFFEFAAC4),
    textTheme: ButtonTextTheme.primary,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF79163C), 
  colorScheme: ColorScheme.dark(
    primary:  const Color(0xFF79163C),
    secondary: Colors.pink[700]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    surface: Colors.grey[850]!,
    background: Colors.grey[900]!,
    error: Colors.red[700]!,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme:  AppBarTheme(
    backgroundColor: Colors.pink[700],
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF79163C),
    foregroundColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.pink[700],
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF79163C),
    textTheme: ButtonTextTheme.primary,
  ),
);

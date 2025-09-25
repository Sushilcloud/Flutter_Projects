import 'package:flutter/material.dart';

class AppThemes
{
  // Light Theme Data
  static final light=ThemeData( // Light theme data
    primaryColor: const Color(0xFFff5722), // Primary color
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed( // Use ColorScheme.fromSeed()
        seedColor: const Color(0xFFff5722),
      primary: const Color(0xFFff5722),
      brightness: Brightness.light,
      surface: Colors.white,
    ),
    cardColor: Colors.white, // Card background color
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFFff5722),
      unselectedItemColor: Colors.grey,
      elevation: 0,
    ),// Bottom navigation bar theme
  ); // Light theme data

  // Dark Theme Data
  static final dark=ThemeData( // Light theme data
    primaryColor: const Color(0xFFff5722), // Primary color
    scaffoldBackgroundColor: Color(0xFF121212),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed( // Use ColorScheme.fromSeed()
      seedColor: const Color(0xFFff5722),
      primary: const Color(0xFFff5722),
      brightness: Brightness.dark,
      surface: Color(0xFF121212),
    ),
    cardColor: Color(0xFF1E1E1E), // Card background color
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFff5722),
      unselectedItemColor: Colors.grey,
      elevation: 0,
    ),// Bottom navigation bar theme
  ); //
}
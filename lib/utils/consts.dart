import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class Constants {
  //App related strings
  static String appName = "Covid - 19";
  //Colors for theme
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xff06d6a7);
  static Color darkAccent = Color(0xff06d6a7);
  static Color lightBG = Colors.white;
  static Color darkBG = Colors.black;
  static Color hide = Colors.transparent;

  static ThemeData lightTheme = ThemeData(
    fontFamily: "TimesNewRoman",
  
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    indicatorColor: darkAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          fontFamily: "TimesNewRoman",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "TimesNewRoman",
    indicatorColor: lightAccent,
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        
        title: TextStyle(
          
          fontFamily: "TimesNewRoman",
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  static formatBytes(bytes, decimals) {
    if (bytes == 0) return 0.0;
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }
}

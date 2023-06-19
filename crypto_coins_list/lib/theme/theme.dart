import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 60, 58, 58),
    primarySwatch: Colors.yellow,
    dividerColor: Colors.white70,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 60, 58, 58),
          fontSize: 27,
          fontWeight: FontWeight.w700,
        )),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      labelSmall: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontWeight: FontWeight.w700,
          fontSize: 14),
    ));

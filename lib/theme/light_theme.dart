import 'package:flutter/material.dart';

ThemeData light({Color color = const Color(0xff0e2844)}) => ThemeData(
      fontFamily: 'Roboto',
      primaryColor:const Color(0xff0e2844),
      backgroundColor: Colors.black,
      secondaryHeaderColor:const Color(0xFF29abe2),
      disabledColor:const Color(0xFFBABFC4),
      brightness: Brightness.light,
      hintColor:const Color(0xFF9F9F9F),
      dividerColor:const Color(0xff1167b1),
      cardColor: Colors.white,
      canvasColor: Colors.pink,
      colorScheme: ColorScheme.light(primary: color, secondary: color),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
    );

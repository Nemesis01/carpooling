import 'package:carpooling/themes/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData defaultTheme() {
  return ThemeData(
    //primarySwatch: Colors.blue,
    //brightness: Brightness.,
    primaryColor: Colors.white,
    accentColor: Colors.deepOrange,
    //primaryColorDark: Colors.blueGrey,
    //splashColor: Colors.lightBlueAccent,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.blueAccent,
    fontFamily: "EncodeCondensed",
    cardColor: Colors.white54,
    buttonColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      height: 40.0, //36.0
    ),
    textTheme: textTheme(),
  );
}

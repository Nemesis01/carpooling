import 'package:carpooling/themes/text_theme.dart';
import 'package:carpooling/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData defaultTheme() {
  return ThemeData(
    //primarySwatch: Colors.white,
    //brightness: Brightness.,
    primaryColor: Colors.white,
    accentColor: Colors.deepPurpleAccent,
    canvasColor: Colors.white,
    //primaryColorDark: Colors.blueGrey,
    //splashColor: Colors.deepOrangeAccent,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    dividerColor: Colors.blueAccent,
    fontFamily: "EncodeCondensed",
    buttonColor: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.deepPurpleAccent,
    ),
    accentIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      height: 40.0, //36.0
    ),
    textTheme: textTheme(),
  );
}

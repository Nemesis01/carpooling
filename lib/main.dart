import 'package:carpooling/routes.dart';
import 'package:carpooling/themes/default_theme.dart';
import 'package:carpooling/views/home.dart';
import 'package:carpooling/views/login.dart';
import 'package:carpooling/themes/text_theme.dart';
import 'package:carpooling/views/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //statusBarColor: Colors.black,
    //statusBarBrightness: Brightness.light,
    //statusBarIconBrightness: Brightness.light,
    //));

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carpooling Application',
      theme: defaultTheme(),

      //iconTheme: IconThemeData(size: 60.0)
      // bottomAppBarColor: Colors.black,

      /*routes: {
        '/': (context) => OffersScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        //'/register': (context) => RegisterScreen(),
      },*/
      home: OffersScreen(),

      onGenerateRoute: Routes.generateRoute,
    );
  }
}

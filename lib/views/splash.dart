import 'package:carpooling/src/resources/strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  @override
  void dispose() {}

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              app_name,
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 38),
            ),
          ],
        ),
      ),
    );
  }
}

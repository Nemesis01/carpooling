import 'package:flutter/material.dart';

enum ScreenType {
  Small,
}

abstract class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 600
        ? smallScreenLayout(context)
        : screenWidth < 800
            ? mediumScreenLayout(context)
            : wideScreenLayout(context);
  }

  Widget smallScreenLayout(BuildContext context);
  Widget mediumScreenLayout(BuildContext context);
  Widget wideScreenLayout(BuildContext context);
}

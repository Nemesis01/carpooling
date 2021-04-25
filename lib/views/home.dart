import 'package:carpooling/utils/strings.dart';
import 'package:carpooling/views/ui/screen_base.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseScreen {
  @override
  Widget smallScreenLayout(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Comodo')),
      body: _body(context),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget mediumScreenLayout(BuildContext context) {
    // TODO: implement mediumScreenLayout
    throw UnimplementedError();
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    // TODO: implement wideScreenLayout
    throw UnimplementedError();
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text(toTitleCase(homeScreenTitle))),
        ],
      ),
    );
  }
}

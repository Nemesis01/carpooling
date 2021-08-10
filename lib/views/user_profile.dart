import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carpooling/src/models/user.dart';
import 'package:carpooling/src/resources/dimens.dart';
import 'package:carpooling/src/resources/strings.dart';

class UserProfileScreen extends StatefulWidget {
  ///
  final items = List<String>.generate(3, (int index) => "List Item $index");

  @override
  _UserProfileScreenState createState() => new _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ///
  /// fields
  ///
  final userProfileScaffoldKey = new GlobalKey<ScaffoldState>();
  final userProfileAppBarKey = new GlobalKey();
  ScrollController? _scrollController;

  //final User _user = User.Create();

  List<String> items = List.generate(100, (index) => "List Item $index");

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color.fromARGB(254, 255, 255, 255),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            _buildAppBar(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController(initialScrollOffset: 54.0);
    //_scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    //_scrollController.dispose();
    super.dispose();
  }

  ///
  ///
  ///
  ///
  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 16.0)),
          CircleAvatar(
              child: Icon(
            Icons.person_outline,
            size: 24.0,
          )),
          Padding(padding: EdgeInsets.only(left: 16.0)),
          Text(
            '',
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ],
      ),

      brightness: Brightness.light,
      pinned: true,
      //floating: true,
    );
  }

  Widget _buildBody() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [],
      ),
    );
  }
}

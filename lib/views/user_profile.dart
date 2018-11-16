import 'package:carpooling/customs/animated_app_bar.dart';
import 'package:carpooling/customs/profile_picture.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:carpooling/res/dimens.dart';
import 'package:carpooling/res/strings.dart';
import 'package:carpooling/customs/card_user_infos.dart';
import 'package:carpooling/customs/card_infos.dart';
import 'package:flutter/services.dart';

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
  ScrollController _scrollController;

  final User _user = new User.create('Stéphane', 'Nton', DateTime.now());

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
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
            '${_user.fullName}',
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
        [
          ProfilePicture(_user),
          InfosCard(
            Strings.section_infos_title,
            icon: Icons.person,
            rowLabels: ['Member since :', 'E-mail :', 'Contact :'],
            datas: [_user.inscrDate, _user.email, _user.phone],
          ),
          InfosCard(
            Strings.section_activity_title,
            icon: Icons.multiline_chart,
            rowLabels: ['Completed Trips :', 'Passengers :', 'Crashes :'],
            datas: [_user.firstName, _user.lastName, _user.fullName],
          ),
          InfosCard(
            Strings.section_car_infos_title,
            icon: Icons.directions_car,
            rowLabels: [
              'Brand :',
              'Model :',
              'Color :',
              'Year :',
              'Matriculation :'
            ],
            datas: [
              'Nissan',
              'Maxima',
              'Dark grey',
              DateTime.now().year.toString(),
              'G8Z 2C1'
            ],
          ),
        ],
      ),
    );
  }
}

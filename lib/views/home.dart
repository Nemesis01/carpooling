import 'package:carpooling/customs/bottom_bar.dart';
import 'package:carpooling/customs/card_user_infos.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/views/offers.dart';
import 'package:carpooling/views/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:carpooling/utils/constants.dart';
import 'package:carpooling/customs/custom_bottom_bar.dart';
import 'package:carpooling/customs/bottom_bar_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _viewPagerController;
  TabController _homeTabController;

 static var user = User.create("Stephane", "Nton", DateTime.now());

  int _pageIndex = 0;

  List<Widget> _pages = [
    new OffersScreen(),
    new UserProfileScreen(),
    new CardUserInfos(user),
    //Container(child: Text(Constants.menu_search)),
    Container(child: Text(Constants.menu_mailbox)),
    Container(child: Text(Constants.menu_more)),
  ];

  List<BottomBarItem> _bottomBarItems = [
    BottomBarItem(icon: Icon(Icons.home), index: 0),
    BottomBarItem(icon: Icon(Icons.directions_car), index: 1),
    BottomBarItem(icon: Icon(Icons.forum), index: 2),
    BottomBarItem(icon: Icon(Icons.menu), index: 3),
  ];


  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: PageView(
          controller: _viewPagerController,
          onPageChanged: _onPageChanged,
          children: _pages,
        ),
        bottomNavigationBar: BottomBar(
          items: _bottomBarItems,
        ),

        floatingActionButton: FloatingActionButton(
          //elevation: 8.0,
          child: Icon(Icons.add, color: Colors.white, size: 32.0,),
          onPressed: () {},
          backgroundColor: Colors.lightBlue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _viewPagerController = new PageController();
    //_homeTabController = new TabController(length: 5, vsync: null);
  }

  @override
  void dispose() {
    super.dispose();
    _viewPagerController.dispose();
    //_homeTabController.dispose();
  }

  void _goToHomeScreen() {
    Navigator.pushNamed(context, '/home');
  }

  void _onBottomMenuItemTapped(int pageIndex) {
    _viewPagerController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      this._pageIndex = pageIndex;
    });
  }
}

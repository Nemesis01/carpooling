import 'package:carpooling/customs/bottom_app_bar.dart';
import 'package:carpooling/customs/bottom_app_bar_item.dart';
import 'package:carpooling/customs/card_user_infos.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/views/more.dart';
import 'package:carpooling/views/offers.dart';
import 'package:carpooling/views/user_profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _viewPagerController;
  TabController _tabController;
  int _selectedTab = 0;

  static var user = User.create("Stephane Nton", "stephane.nnn",
      inscriptionDate: DateTime.now());

  int _pageIndex = 0;

  List<Widget> _pages = [
    new OffersScreen(),
    new UserProfileScreen(),
    new CardUserInfos(user),
    new MoreScreen(),
    //Container(child: Text(Constants.menu_mailbox)),
    //Container(child: Text(Constants.menu_more)),
  ];

  List<BottomAppBarItem> _bottomBarItems = [
    BottomAppBarItem(icon: Icons.home),
    BottomAppBarItem(icon: Icons.directions_car),
    BottomAppBarItem(icon: Icons.forum),
    BottomAppBarItem(icon: Icons.menu),
  ];

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        /*body: PageView(
          controller: _viewPagerController,
          onPageChanged: _onPageChanged,
          children: _pages,
        ),*/
        // drawer: _navigationDrawer(),
        body: _pages[_pageIndex],
        bottomNavigationBar: BottomBar(
          items: _bottomBarItems,
          onItemSelected: _onBottomMenuItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32.0,
          ),
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
    //_tabController = new TabController(length: _pages.length, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _viewPagerController.dispose();
    _tabController.dispose();
  }

  Widget _navigationDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }

  void _goToHomeScreen() {
    Navigator.pushNamed(context, '/home');
  }

  void _onBottomMenuItemTapped(int pageIndex) {
    _onPageChanged(pageIndex);
    /*_viewPagerController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );*/
    //_onPageChanged(pageIndex);
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      this._pageIndex = pageIndex;
    });
  }
}

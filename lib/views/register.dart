import 'package:carpooling/views/register_page_one.dart';
import 'package:flutter/material.dart';
import 'package:carpooling/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldState> _registerScaffoldKey =
      GlobalKey<ScaffoldState>();

  PageController _pageViewController;
  List<Widget> _pageViewChildren = [
    new RegisterScreenPageOne(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _registerScaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          disabledColor: Colors.transparent,
        ),
        title: Text(
          Constants.registerScreenTitle,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: SafeArea(
        //child: Container(
          child: PageView(
            controller: _pageViewController,
            onPageChanged: _onPageChanged,
            children: _pageViewChildren,
          ),
        //),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageViewController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  void _onPageChanged(int index) {}
}

class _RegisterData {
  String _firstName;
  String _lastName;
  String _fullName;
  String _email;
  String _phoneNumber;
  String _password;
}

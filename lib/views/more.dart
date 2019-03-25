import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => new _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      top: true,
      right: true,
      bottom: true,
      left: true,
      child: ListView(
        //itemExtent: 30.0,
        children: <Widget>[
          Text(
            'More',
            style: TextStyle(
              fontSize: 48.0,
            ),
          ),
          ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Profile'),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Exit'),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Exit'),
              onTap: () {}),
        ],
      ),
    );
  }
}

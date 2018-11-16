import 'package:flutter/material.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/res/dimens.dart';

class ProfilePicture extends StatelessWidget {
  final User user;

  ProfilePicture(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Dimens.flexible_app_bar_background_height,
      margin: EdgeInsets.only(top: Dimens.BOTTOM_APPBAR_HEIGHT),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0),
              ),
              child: CircleAvatar(
                radius: 75.0,
                backgroundColor: Colors.white70,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 80.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(user.fullName, style: Theme.of(context).textTheme.headline),
        ],
      ),
    );
  }
}

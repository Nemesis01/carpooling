import 'package:carpooling/res/strings.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';

class CardUserInfos extends StatelessWidget {
  ///
  ///
  ///
  final User user;

  ///
  ///
  ///
  ///
  CardUserInfos(this.user);

  ///
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
          elevation: 8.0,
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(Strings.section_infos_title,
                        style: TextStyle(fontSize: Theme.of(context).textTheme.headline.fontSize)),
                    GridView.count(
                      crossAxisCount: 2,
                      /*children: List.generate(3, (index){
                        return ListTile(),
                      })*/
                      children: [
                        ListTile(leading: Text(Strings.label_inscription_date), title: Text(user.fullName)) ,
                        ListTile(leading: Text(Strings.label_inscription_date), title: Text(user.fullName)) ,
                        ListTile(leading: Text(Strings.label_inscription_date), title: Text(user.fullName)) ,
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  child: FlatButton(
                    child: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  top: 0.0,
                  right: 0.0),
            ],
          )),
    );
  }
}

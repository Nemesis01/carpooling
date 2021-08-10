import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomListTile extends StatelessWidget {
  final String _title;
  final Widget? leading;
  final Widget? subtitle;

  const CustomListTile(
    this._title, {
    this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      //color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        // TODO: hardcoded value
        // margin: EdgeInsets.only(top: 8.0),
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
        //color: Colors.white,
        child: Column(
          children: [
            //Icon(LineIcons.car),
            //Text('Driver'),
            ListTile(
              //dense: true,
              leading: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 4.0,
                child: leading.runtimeType is IconData
                    ? Icon(leading as IconData)
                    : leading,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Driver'),
                  Text(
                    'Driver\'s name or Nickname',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              //subtitle: ,
            )
          ],
        ),
      ),
    );
  }
}

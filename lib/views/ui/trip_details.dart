import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              LineIcons.play,
              size: 32.0,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              'Ville de départ',
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text('UQTR - Aux cubes'),
          ),
          ListTile(
            leading: Icon(
              LineIcons.mapMarker,
              size: 32.0,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              'Ville de départ',
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text('Métro Berry-UQAM'),
          ),
        ],
      ),
    );
  }
}

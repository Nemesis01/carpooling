import 'package:carpooling/src/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OfferView extends StatelessWidget {
  final String name;
  final String offerer;
  final VoidCallback onTap;

  OfferView({
    required this.name,
    required this.offerer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      //color: Colors.transparent,
      //type: MaterialType.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          // margin: EdgeInsets.symmetric(vertical: 4.0),
          padding:
              EdgeInsets.only(left: 8.0, top: 8.0, right: 16.0, bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Expanded(
                flex: 2,
                child: Column(
                  children: [
                    CircleAvatar(),
                    Text('John Doe'),
                  ],
                ),
              ),*/
              Expanded(
                flex: 8,
                child: tripOverview(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tripOverview(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ste anne-de-la-pérade du monde mondialement mondialisé'
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    'Point de rencontre',
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Text('vers'),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'montréal'.toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle2,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                  Text(
                    'Point de rencontre',
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text('16h30', style: Theme.of(context).textTheme.headline6),
          ],
        ),
        Row(
          children: [paymentMethod(context)],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: tripConveniences(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(LineIcons.users),
                Text(' : 4', style: Theme.of(context).textTheme.headline6)
              ],
            ),
            Text(
              '25',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ],
    );
  }

  Widget tripConveniences(BuildContext context) {
    var conveniences = Convenience.values.toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: conveniences
          .map((convenience) => convenienceToIcon(context, convenience))
          .toList(),
    );
  }

  Widget paymentMethod(BuildContext context) {
    return Icon(
      LineIcons.creditCard,
      size: 38,
    );
  }

  Icon convenienceToIcon(BuildContext context, Convenience convenience) {
    IconData iconData;

    switch (convenience) {
      case Convenience.Wifi:
        iconData = LineIcons.wifi;
        break;
      case Convenience.Smoking:
        iconData = LineIcons.smokingBan;
        break;
      case Convenience.Pets:
        iconData = LineIcons.paw;
        break;
      case Convenience.Luggages:
        iconData = LineIcons.suitcaseRolling;
        break;
      case Convenience.AirConditioning:
        iconData = LineIcons.snowflake;
        break;
      case Convenience.PaymentWithCard:
        iconData = LineIcons.creditCard;
        break;
    }

    return Icon(
      iconData,
      color: Theme.of(context).accentIconTheme.color,
    );
  }
}

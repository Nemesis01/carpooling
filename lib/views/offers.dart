import 'package:carpooling/src/models/offer.dart';
import 'package:carpooling/src/models/user.dart';
import 'package:carpooling/src/resources/strings.dart';
import 'package:carpooling/views/ui/offer_view.dart';
import 'package:carpooling/views/ui/screen_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final dummySnapshot = [
  {"offerer": "Stef", "departure": "TRO", "destination": "MTL"},
  {"offerer": "Verna", "departure": "TR", "destination": "MTL"},
  {"offerer": "Ruth", "departure": "QC", "destination": "TR"},
  {"offerer": "Serge", "departure": "NY", "destination": "MTL"},
];

class OffersScreen extends BaseScreen {
  /* @override
  Widget build(BuildContext context) {
    return Scaffold();
  }*/

  @override
  Widget mediumScreenLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              var offer = dummySnapshot[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: OfferView(
                  offerer: 'Stephane Nton',
                  name: 'Stéphane Nton',
                  onTap: () {
                    print('Offer tapped tile');

                    Navigator.of(context).pushNamed(offerDetailRoute);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget smallScreenLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: dummySnapshot.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: OfferView(
                  offerer: 'StephaneNton',
                  name: 'Stéphane Nton',
                  onTap: () {
                    Navigator.of(context).pushNamed(offerDetailRoute);
                    print('Offer tapped tile');
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    // TODO: implement wideScreenLayout
    throw UnimplementedError();
  }
}

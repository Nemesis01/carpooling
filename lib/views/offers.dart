import 'package:carpooling/models/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carpooling/utils/constants.dart';

final dummySnapshot = [
  {"offerer": "Stef", "departure": "TRO", "destination": "MTL"},
  {"offerer": "Verna", "departure": "TR", "destination": "MTL"},
  {"offerer": "Ruth", "departure": "QC", "destination": "TR"},
  {"offerer": "Serge", "departure": "NY", "destination": "MTL"},
];

class OffersScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('offers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
    /*return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
                //color: Colors.white,
                ),
            title: Text(Constants.menu_offers),
          ),
          floating: false,
          pinned: true,
        ),
        /*SliverList(
          delegate: SliverChildListDelegate(
            [_buildList(context, dummySnapshot)],
          ),
        ),*/
      ],
    );*/
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final offer = Offer.fromSnapshot(data);

    return Padding(
      key: ValueKey(offer.offerer),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          isThreeLine: true,
          title: Text(offer.offerer),
          trailing: Text(offer.departure),
          subtitle: Text(offer.destination),
          onTap: () => Firestore.instance.runTransaction((transaction) async {
                final freshSnapshot = await transaction.get(offer.reference);
                final fresh = Offer.fromSnapshot(freshSnapshot);

                await transaction.update(
                    offer.reference, {'passengers': fresh.passengers + 1});
              }),
        ),
      ),
    );
  }
}

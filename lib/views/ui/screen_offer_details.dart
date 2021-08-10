import 'package:carpooling/views/ui/list_tile.dart';
import 'package:carpooling/views/ui/screen_base.dart';
import 'package:carpooling/views/ui/sliver_persistent_header_delegate.dart';
import 'package:carpooling/views/ui/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icons.dart';

class OfferDetailsScreen extends BaseScreen {
  @override
  Widget mediumScreenLayout(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  @override
  Widget smallScreenLayout(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  @override
  Widget wideScreenLayout(BuildContext context) {
    // TODO: implement wideScreenLayout
    throw UnimplementedError();
  }

  Widget body(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          _tripDetails(context),
          _dateTime(context),
          /* SliverAppBar(
            title: Text('offer details'),
          )*/
          _informations(context),
          SliverFillRemaining(),
        ],
      ),
    );
  }

  Widget _tripDetails(BuildContext context) {
    return SliverAppBar(
      title: Text('offer details'),
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.only(top: 54.0),
          child: TripDetails(),
        ),
      ),
      //bottom: ,
    );
  }

  Widget _dateTime(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true, delegate: PersistentHeaderDelegate('title'));
  }

  Widget _informations(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          CustomListTile(
            '_title',
            leading: Material(),
          )
        ],
      ),
    );
  }
}

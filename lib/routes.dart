import 'package:carpooling/src/resources/strings.dart';
import 'package:carpooling/views/offers.dart';
import 'package:carpooling/views/ui/screen_offer_details.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) => OffersScreen(),
        );
      case defaultRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => OffersScreen(),
        );
      case offerDetailRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => OfferDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => OffersScreen(),
        );
    }
  }

  MaterialPageRoute _buildRoute(String routeName) {
    return MaterialPageRoute(builder: (BuildContext context) => OffersScreen());
  }
}

import 'package:carpooling/src/models/offer.dart';

abstract class OfferState {}

class OfferListPresented extends OfferState {
  final List<Offer> offers;

  OfferListPresented(this.offers);
}

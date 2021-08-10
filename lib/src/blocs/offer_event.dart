import 'package:meta/meta.dart';

import 'package:carpooling/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class OfferEvent extends Equatable {
  const OfferEvent();
}

class OfferPublished extends OfferEvent {
  final User publisher;

  const OfferPublished(this.publisher);

  @override
  List<Object> get props => [publisher];
}

class OfferUpdated extends OfferEvent {
  final User publisher;
  const OfferUpdated(this.publisher);

  @override
  List<Object> get props => [publisher];
}

class OfferBooked extends OfferEvent {
  final User passenger;
  const OfferBooked(this.passenger);

  @override
  List<Object> get props => [passenger];
}

class OfferCancelled extends OfferEvent {
  final User publisher;
  const OfferCancelled(this.publisher);

  @override
  List<Object> get props => [publisher];
}

class OfferCompleted extends OfferEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

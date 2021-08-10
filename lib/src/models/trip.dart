import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum Convenience {
  Wifi,
  Smoking,
  Pets,
  Luggages,
  AirConditioning,
  PaymentWithCard,
}

class Trip {
  ///
  /// MEMBERS
  final String departureCity;
  final String arrivalCity;
  final String startingPoint;
  final String dropPoint;
  final DocumentReference? reference;
  //final String id;
  //final List<Convenience> conveniences;

  /* Trip({
    @required this.id,
    this.conveniences,
  });
  */

  ///
  /// CONSTRUCTORS
  Trip.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : assert(map['departureCity'] != null),
        departureCity = map['departureCity'],
        arrivalCity = map['arrivalCity'],
        startingPoint = map['startingPoint'],
        dropPoint = map['dropPoint'];

  Trip.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map, reference: snapshot.reference);
}

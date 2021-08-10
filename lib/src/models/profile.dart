import 'package:carpooling/src/models/trip.dart';
import 'package:carpooling/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Profile {
  ///   FIELDS
  final User user;
  final DateTime inscriptionDate;
  final int completedTrips;
  final int transportedPassengers;
  final List<String> favoriteDestinations;
  final List<Trip> favoriteTrips;
  final List<String> allDestinations;
  final DocumentReference? reference;

  //User user;

  ///
  ///   CONSTRUCTORS
  Profile.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : assert(map['userId'] != null),
        assert(map['completedTrips'] < 0),
        assert(map['transportedPassengers'] < 0),
        user = map['userId'],
        inscriptionDate = map['inscriptionDate'],
        completedTrips = map['completedTrips'],
        transportedPassengers = map['transportedPassengers'],
        favoriteDestinations = map['favoriteDestinations'],
        favoriteTrips = map['favoriteTrips'],
        allDestinations = map['allDestinations'];

  Profile.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map, reference: snapshot.reference);

  ///
  ///
  ///   GETTERS AND SETTERS

  ///
  ///
  ///
  ///   OTHER METHODS
  @override
  String toString() {
    return '';
  }
}

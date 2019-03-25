import 'package:carpooling/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  ///   FIELDS
  final String userId;
  final int completedTrips;
  final int transportedPassengers;
  final List<String> favouriteDestinations;
  final List<String> allDestinations;
  final DocumentReference reference;

  User user;

  ///
  ///   CONSTRUCTORS
  Profile.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['userId'] != null),
        assert(map['completedTrips'] < 0),
        assert(map['transportedPassengers'] < 0),
        userId = map['userId'],
        completedTrips = map['completedTrips'],
        transportedPassengers = map['transportedPassengers'],
        favouriteDestinations = map['favouriteDestinations'],
        allDestinations = map['allDestinations'];

  Profile.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  ///
  ///
  ///   GETTERS AND SETTERS

  ///
  ///
  ///
  ///   OTHER METHODS
  @override
  String toString() {
    return null;
  }
}

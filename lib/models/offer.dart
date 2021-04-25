import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  final String offerer;
  final String departure;
  final String destination;
  final int passengers;
  final DocumentReference reference;

  Offer.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['offerer'] != null),
        assert(map['destination'] != null),
        assert(map['departure'] != null),
        offerer = map['offerer'],
        departure = map['departure'],
        destination = map['destination'],
        passengers = map['passengers'];

  Offer.fromJson(Map<String, dynamic> json, {this.reference})
      : assert(json['offerer'] != null),
        assert(json['destination'] != null),
        assert(json['departure'] != null),
        offerer = json['offerer'],
        departure = json['departure'],
        destination = json['destination'],
        passengers = json['passengers'];

  Offer.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Offer<$offerer:$departure -> $destination>";
}

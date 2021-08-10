import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  ///
  ///
  final String brand;
  final String model;
  final String color;
  final int year;
  final String matriculationNumber;
  final int places;
  final DocumentReference reference;

  ///
  ///
  Car.fromMap(Map<dynamic, dynamic> map, {required this.reference})
      : assert(map['brand'] != null),
        assert(map['model'] != null),
        assert(map['matriculationNumber'] != null),
        brand = map['brand'],
        model = map['model'],
        color = map['color'],
        year = map['year'],
        matriculationNumber = map['matriculationNumber'],
        places = map['places'];

  Car.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map, reference: snapshot.reference);

  ///
  ///

}

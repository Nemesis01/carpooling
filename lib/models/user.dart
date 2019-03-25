import 'package:carpooling/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  ///     FIELDS
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  //final int age;
  final DateTime inscriptionDate;
  //final GeoPoint localisation;
  final Profile profile;
  final DocumentReference reference;

  ///
  ///     CONSTRUCTORS
  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['fullName'] != null),
        assert(map['email'] != null),
        assert(map['phoneNumber'] != null),
        assert(map['password'] != null),
        //assert(map['age'] > 15),
        fullName = map['fullName'],
        email = map['email'],
        phoneNumber = map['phoneNumber'],
        password = map['fullName'],
        inscriptionDate = map['inscriptionDate'],
        //localisation = map['localisation']
        profile = map['profile'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  User.create(this.fullName, this.email,
      {this.phoneNumber,
      this.password,
      this.inscriptionDate,
      this.profile,
      this.reference});

  ///
  ///
  ///   GETTERS AND SETTERS
  String get inscrDate {
    StringBuffer buffer = new StringBuffer();
    buffer.write(inscriptionDate.day);
    buffer.write('-');
    buffer.write(inscriptionDate.month);
    buffer.write('-');
    buffer.write(inscriptionDate.year);

    return buffer.toString();
  }
}

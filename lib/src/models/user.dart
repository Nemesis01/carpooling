import 'package:carpooling/src/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  ///     FIELDS
  final String firstName;
  final String lastName;
  final String username;
  //final String email;
  //final String phoneNumber;
  //final String password;
  //final DateTime inscriptionDate;
  final Profile profile;
  final DocumentReference? reference;

  ///
  ///     CONSTRUCTORS
  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['username'] != null),
        assert(map['email'] != null),
        assert(map['phoneNumber'] != null),
        assert(map['password'] != null),
        //assert(map['age'] > 15),
        firstName = map['firstName'],
        lastName = map['lastName'],
        username = map['username'],
        // email = map['email'],
        //phoneNumber = map['phoneNumber'],
        //password = map['fullName'],
        //inscriptionDate = map['inscriptionDate'],
        //localisation = map['localisation']
        profile = map['profile'];

  /*User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);*/

  User.create(this.firstName, this.lastName, this.username, this.profile,
      //this.email,
      {this.reference});

  ///
  ///
  ///   GETTERS AND SETTERS
  /* String get inscrDate {
    StringBuffer buffer = new StringBuffer();
    buffer.write(inscriptionDate.day);
    buffer.write('-');
    buffer.write(inscriptionDate.month);
    buffer.write('-');
    buffer.write(inscriptionDate.year);

    return buffer.toString();
  }*/
}

import 'package:carpooling/models/profile.dart';

class User{

  ///
  ///     FIELDS
  ///
  String firstName;
  String lastName;
  String fullName;
  String email;
  String phone;
  final DateTime inscriptionDate;
  Profile profile;


  ///
  ///     CONSTRUCTORS
  ///
  User({this.firstName, this.lastName, this.fullName, this.inscriptionDate, this.profile}){
    this.fullName = '$firstName $lastName';
  }
  User.create(this.firstName, this.lastName, this.inscriptionDate){
    this.fullName = '$firstName $lastName' ;
  }
  User.fromJson({this.inscriptionDate});



  ///
  ///     GETTERS AND SETTERS
  ///
  /*Profile get profile => _profile;

  set profile(Profile value) {
    _profile = value;
  }

  DateTime get birthDate => _inscriptionDate;

  set birthDate(DateTime value) {
    birthDate = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get fullName => _fullName;

  set fullName(String value){
    _fullName = value;
  }*/

  String get inscrDate{
    StringBuffer buffer = new StringBuffer();
    buffer.write(inscriptionDate.day);
    buffer.write('-');
    buffer.write(inscriptionDate.month);
    buffer.write('-');
    buffer.write(inscriptionDate.year);

    return buffer.toString();
  }

}


class Contact{

  String _phoneNumber;
  String _email;
  String _city;

  // Latitude et Longitude actuelles
  // dernière position connue

}


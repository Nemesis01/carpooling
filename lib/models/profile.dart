import 'package:carpooling/models/user.dart';

class Profile{

  ///
  final User user;
  int _completedTrips;
  int _transportedPassengers;
  List<String> _favouriteDestinations;
  List<String> _allDestinations;

  ///
  Profile(this.user);


  ///
  /// GETTERS AND SETTERS
  ///
  ///
  int get completedTrips => this._completedTrips;
  int get transportedPassengers => this._transportedPassengers;
  List<String> get favouriteDestinations => this._favouriteDestinations;
  List<String> get allDestinations => this._allDestinations;




}
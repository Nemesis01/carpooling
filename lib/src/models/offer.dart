import 'package:carpooling/src/models/trip.dart';
import 'package:carpooling/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'offer.g.dart';

@JsonSerializable()
class Offer {
  ///
  ///
  /// MEMBER(S)
  ///
  final User offerer;
  final Trip trip;
  final DateTime date;
  final DateTime time;
  final double price;
  final int totalPlaces;
  final int? availablePlaces;
  final List<Convenience>? conveniences;
  DocumentReference? reference;

  ///
  ///
  /// CONSTRUCTOR(S)
  ///
  Offer(
    this.offerer,
    this.trip,
    this.date,
    this.time,
    this.price,
    this.totalPlaces, {
    this.availablePlaces,
    this.conveniences,
    this.reference,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _OfferFromJson(json);

  Offer.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : assert(map['offerer'] != null),
        assert(map['trip'] != null),
        assert(map['date'] != null),
        assert(map['time'] != null),
        assert(map['totalPlaces'] != null),
        offerer = map['offerer'],
        trip = map['trip'],
        date = map['starting_date_time'],
        time = map['starting_date_time'],
        price = map['price'],
        totalPlaces = map['totalPlaces'],
        availablePlaces = map['availablePlaces'],
        conveniences = map['conveniences'];

  Offer.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map, reference: snapshot.reference);

  ///
  ///
  /// GETTERS AND SETTERS
  ///
  //int totalPlaces

  ///
  ///
  /// JSON SERIALIZATION HELPER METHODS
  ///
  Map<String, dynamic> toJson() => _OfferToJson(this);
}

Offer _OfferFromJson(Map<dynamic, dynamic> json) => Offer(
      json['offerer'] as User,
      json['trip'] as Trip,
      DateTime.parse(json['starting_date_time'] as String),
      DateTime.parse(json['starting_date_time'] as String),
      json['price'] as double,
      json['totalPlaces'] as int,
      availablePlaces: json['availablePlaces'] as int,
      conveniences: json['conveniences'] as List<Convenience>,
      reference: json['reference'] as DocumentReference,
    );

Map<String, dynamic> _OfferToJson(Offer instance) => <String, dynamic>{
      'offerer': instance.offerer,
      'trip': instance.trip,
      'starting_date_time': Timestamp.now(),
      'price': instance.price,
      'totalPlaces': instance.totalPlaces,
      'availablePlaces': instance.totalPlaces
    };

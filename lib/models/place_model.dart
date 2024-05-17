import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:tom/common/types/category.dart';

class Place {
  String id;
  String name;
  String providerId;
  String phoneNumber;
  String website;
  PlaceCategory category;
  GeoFirePoint location;
  String workHours;
  int rateCount;
  double avgRate;

  Place({
    required this.id,
    required this.name,
    required this.providerId,
    required this.phoneNumber,
    required this.website,
    required this.category,
    required this.location,
    required this.workHours,
    required this.rateCount,
    required this.avgRate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'providerId': providerId,
      'phoneNumber': phoneNumber,
      'website': website,
      'category': category.name,
      'location': location.data,
      'workHours': workHours,
      'rateCount': rateCount,
      'avgRate': avgRate
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'] as String,
      name: map['name'] as String,
      providerId: map['providerId'] as String,
      phoneNumber: map['phoneNumber'] as String,
      website: map['website'] as String,
      category: getCategoryFromString(map['category']),
      location: GeoFirePoint(map['location']['geopoint'] as GeoPoint),
      workHours: map['workHours'] as String,
      rateCount: map['rateCount'],
      avgRate: map['avgRate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Place other) {
    if (identical(this, other)) return true;
    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

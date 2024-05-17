import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:tom/common/types/gender.dart';
import 'package:tom/common/types/user.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  Gender gender;
  UserType userType;
  GeoFirePoint location;
  int rateCount;
  double avgRate;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.gender,
    required this.userType,
    required this.location,
    required this.rateCount,
    required this.avgRate,
  });

  String get fullName => '$firstName $lastName';

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        phoneNumber: '',
        gender: Gender.male,
        userType: UserType.wheelchair,
        location: const GeoFirePoint(GeoPoint(0, 0)),
        rateCount: 0,
        avgRate: 0.0,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'gender': gender.name,
      'userType': userType.name,
      'location': location.data,
      'rateCount': rateCount,
      'avgRate': avgRate
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      gender: getGenderFromString(map['gender']),
      userType: getUserTypeFromString(map['userType']),
      location: GeoFirePoint(map['location']['geopoint'] as GeoPoint),
      rateCount: map['rateCount'],
      avgRate: map['avgRate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

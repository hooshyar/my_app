// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserOfApp {
  String name;
  String uid;
  String phonenumber;
  String email;
  String? latitude;
  String? longitude;
  DateTime dateTime;
  DocumentReference? reference;

  UserOfApp({
    required this.name,
    required this.uid,
    required this.phonenumber,
    required this.email,
    this.latitude,
    this.longitude,
    required this.dateTime,
    this.reference,
  });

  UserOfApp copyWith({
    String? name,
    String? uid,
    String? phonenumber,
    String? email,
    String? latitude,
    String? longitude,
    DateTime? dateTime,
  }) {
    return UserOfApp(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'phonenumber': phonenumber,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory UserOfApp.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return UserOfApp.fromMap(documentSnapshot.data() as Map<String, dynamic>,
        reference: documentSnapshot.reference);
  }
  factory UserOfApp.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return UserOfApp(
      name: map['name'] as String,
      uid: map['uid'] as String,
      phonenumber: map['phonenumber'] as String,
      email: map['email'] as String,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      reference: reference,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserOfApp.fromJson(String source) =>
      UserOfApp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserOfApp(name: $name, uid: $uid, phonenumber: $phonenumber, email: $email, latitude: $latitude, longitude: $longitude, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant UserOfApp other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.uid == uid &&
        other.phonenumber == phonenumber &&
        other.email == email &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        phonenumber.hashCode ^
        email.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        dateTime.hashCode;
  }
}

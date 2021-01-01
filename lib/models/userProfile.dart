import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String uid;
  String name;
  String gender;
  String interestedIn;
  String photoUrl;
  Timestamp age;
  GeoPoint location;
  UserProfile({
    this.uid,
    this.name,
    this.gender,
    this.interestedIn,
    this.photoUrl,
    this.age,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'gender': gender,
      'interestedIn': interestedIn,
      'photoUrl': photoUrl,
      'age': age,
      'location': location,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserProfile(
      uid: map['uid'],
      name: map['name'],
      gender: map['gender'],
      interestedIn: map['interestedIn'],
      photoUrl: map['photoUrl'],
      age: map['age'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(uid: $uid, name: $name, gender: $gender, interestedIn: $interestedIn, photoUrl: $photoUrl, age: $age, location: $location)';
  }

  UserProfile copyWith({
    String uid,
    String name,
    String gender,
    String interestedIn,
    String photoUrl,
    Timestamp age,
    GeoPoint location,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      interestedIn: interestedIn ?? this.interestedIn,
      photoUrl: photoUrl ?? this.photoUrl,
      age: age ?? this.age,
      location: location ?? this.location,
    );
  }
}

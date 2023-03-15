// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmToken;
  Timestamp? addTime;
  UserData({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.location,
    required this.fcmToken,
    required this.addTime,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final map = snapshot.data();
    return UserData(
        id: map?['id'] != null ? map!['id'] as String : null,
        displayName:
            map?['displayName'] != null ? map!['displayName'] as String : null,
        email: map?['email'] != null ? map!['email'] as String : null,
        photoUrl: map?['photoUrl'] != null ? map!['photoUrl'] as String : null,
        location: map?['location'] != null ? map!['location'] as String : null,
        fcmToken: map?['fcmToken'] != null ? map!['fcmToken'] as String : null,
        addTime: map?['addTime'] != null ? map!['addTime'] as Timestamp : null);
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      if (id != null) 'id': id,
      if (displayName != null) 'displayName': displayName,
      if (email != null) 'email': email,
      if (photoUrl != null) 'photoUrl': photoUrl,
      if (location != null) 'location': location,
      if (fcmToken != null) 'fcmToken': fcmToken,
      if (addTime != null) 'addTime': addTime,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'location': location,
      'fcmToken': fcmToken,
      'addTime': addTime,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
        id: map['id'] != null ? map['id'] as String : null,
        displayName:
            map['displayName'] != null ? map['displayName'] as String : null,
        email: map['email'] != null ? map['email'] as String : null,
        photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
        location: map['location'] != null ? map['location'] as String : null,
        fcmToken: map['fcmToken'] != null ? map['fcmToken'] as String : null,
        addTime: map['addTime'] != null ? map['addTime'] as Timestamp : null);
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(id: $id, displayName: $displayName, email: $email, photoUrl: $photoUrl, location: $location, fcmToken: $fcmToken, addTime: $addTime)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.displayName == displayName &&
        other.email == email &&
        other.photoUrl == photoUrl &&
        other.location == location &&
        other.fcmToken == fcmToken &&
        other.addTime == addTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        displayName.hashCode ^
        email.hashCode ^
        photoUrl.hashCode ^
        location.hashCode ^
        fcmToken.hashCode ^
        addTime.hashCode;
  }
}

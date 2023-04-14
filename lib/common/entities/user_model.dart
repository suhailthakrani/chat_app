// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? displayName;
  String? email;
  String? accessToken;
  String? photoUrl;
  UserModel({
    this.displayName,
    this.email,
    this.accessToken,
    this.photoUrl,
  });

  UserModel copyWith({
    String? displayName,
    String? email,
    String? accessToken,
    String? photoUrl,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'accessToken': accessToken,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      accessToken: map['accessToken'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) {
    print("===================> $source");
    Map<String, dynamic> map = json.decode(source);

    // Check if required properties are present
    if (map['displayName'] == null ||
        map['email'] == null ||
        map['accessToken'] == null) {
      throw FormatException("Missing required properties in JSON string");
    }

    return UserModel(
      displayName: map['displayName'] as String?,
      email: map['email'] as String?,
      accessToken: map['accessToken'] as String?,
      photoUrl: map['photoUrl'] as String?,
    );
  }
  @override
  String toString() {
    return 'UserModel(displayName: $displayName, email: $email, accessToken: $accessToken, photoUrl: $photoUrl)';
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? displayName;
  String? email;
  String? id;
  String? photoUrl;
  UserModel({
    this.displayName,
    this.email,
    this.id,
    this.photoUrl,
  });

  UserModel copyWith({
    String? displayName,
    String? email,
    String? id,
    String? photoUrl,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'id': id,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      id: map['id'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(displayName: $displayName, email: $email, id: $id, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.displayName == displayName &&
      other.email == email &&
      other.id == id &&
      other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
      email.hashCode ^
      id.hashCode ^
      photoUrl.hashCode;
  }
}

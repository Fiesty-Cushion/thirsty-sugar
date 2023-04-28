import 'package:flutter/foundation.dart';

@immutable
class UserModel{
  final String userName;
  final String email;
  final String profilePic;
  final String uid;

  const UserModel({
    required this.userName,
    required this.email,
    required this.profilePic,
    required this.uid,
  });

  @override
  String toString() {
    return 'UserModel{ userName: $userName, email: $email, profilePic: $profilePic, uid: $uid,}';
  }

  UserModel copyWith({
    String? userName,
    String? email,
    String? profilePic,
    String? uid,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['\$id'] as String,
    );
  }
}
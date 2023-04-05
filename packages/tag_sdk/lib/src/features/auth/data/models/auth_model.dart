import 'dart:convert';

import 'package:tag_sdk/src/features/auth/data/models/user_model.dart';

class AuthModel{
  String? accessToken;
  String? schoolYear;
  UserModel? user;

  AuthModel({
    this.accessToken,
    this.user,
  });

  AuthModel copyWith({
    String? accessToken,
    UserModel? user,
  }) {
    return AuthModel(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'user': user?.toMap(),
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: map['access_token'],
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() => 'AuthModel(accessToken: $accessToken, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthModel &&
        other.accessToken == accessToken &&
        other.user == user;
  }

  @override
  int get hashCode => accessToken.hashCode ^ user.hashCode;
}

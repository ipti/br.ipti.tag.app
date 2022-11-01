import 'dart:convert';

import 'package:tag_sdk/src/features/auth/domain/entities/auth_login.dart';

class AuthLoginModel extends AuthLogin {
  AuthLoginModel({required super.username, required super.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory AuthLoginModel.fromMap(Map<String, dynamic> map) {
    return AuthLoginModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthLoginModel.fromJson(String source) =>
      AuthLoginModel.fromMap(json.decode(source));

  @override
  String toString() => 'AuthLogin(username: $username, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthLogin &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}

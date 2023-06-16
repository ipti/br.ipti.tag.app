import 'dart:convert';

class AuthLoginModel{
  final String username;
  final String password;

  AuthLoginModel({
    required this.username,
    required this.password,
  });

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

  AuthLoginModel copyWith({
    String? username,
    String? password,
  }) {
    return AuthLoginModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthLoginModel &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}

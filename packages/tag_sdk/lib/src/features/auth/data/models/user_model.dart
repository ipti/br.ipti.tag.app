import 'dart:convert';
import 'package:collection/collection.dart';
import 'auth_school.dart';

class UserModel {
  final int? id;
  final String? name;
  final List<AuthSchool>? schools;
  final String? username;
  final String? role;

  UserModel({
    this.id,
    this.name,
    this.schools,
    this.username,
    this.role,
  });

  UserModel copyWith({
    int? id,
    String? name,
    List<AuthSchool>? schools,
    String? username,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      schools: schools ?? this.schools,
      username: username ?? this.username,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schools': schools
          ?.map(
            (x) => x.toJson(),
          )
          .toList(),
      'username': username,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final schools = List.from(map['schools'] ?? []);

    return UserModel(
      id: map['id'],
      name: map['name'],
      schools: List<AuthSchool>.from(
        schools.map(
          (x) => AuthSchool.fromJson(x),
        ),
      ),
      username: map['username'],
      role: map['role'],
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory UserModel.fromJson(String source) => UserModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return '''UserModel(id: $id, name: $name, schools: $schools, username: $username, role $role)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UserModel && other.id == id && other.name == name && listEquals(other.schools, schools) && other.username == username && other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ schools.hashCode ^ username.hashCode ^ role.hashCode;
  }
}

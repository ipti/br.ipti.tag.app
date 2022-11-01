import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';

class UserModel extends User {
  UserModel({
    super.id,
    super.name,
    super.schools,
    super.username,
    super.active,
  });

  UserModel copyWith({
    int? id,
    String? name,
    List<SchoolModel>? schools,
    String? username,
    int? active,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      schools: schools ?? this.schools as List<SchoolModel>?,
      username: username ?? this.username,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schools': schools
          ?.map(
            (x) => (x as SchoolModel).toMap(),
          )
          .toList(),
      'username': username,
      'active': active,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final schools = List.from(map['schools'] ?? []);

    return UserModel(
      id: map['id'],
      name: map['name'],
      schools: List<SchoolModel>.from(
        schools.map(
          (x) => SchoolModel.fromMap(x),
        ),
      ),
      username: map['username'],
      active: map['active'],
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
    return '''UserModel(id: $id, name: $name, schools: $schools, username: $username, active $active)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        listEquals(other.schools, schools) &&
        other.username == username &&
        other.active == active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        schools.hashCode ^
        username.hashCode ^
        active.hashCode;
  }
}

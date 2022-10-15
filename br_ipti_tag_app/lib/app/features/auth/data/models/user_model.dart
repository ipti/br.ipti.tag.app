import 'dart:convert';
import 'package:br_ipti_tag_app/app/features/auth/data/models/school_model.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/user.dart';
import 'package:collection/collection.dart';

class UserModel extends User {
  UserModel({
    int? id,
    String? name,
    List<SchoolModel>? schools,
    String? username,
  }) : super(id: id, name: name, schools: schools, username: username);

  UserModel copyWith({
    int? id,
    String? name,
    List<SchoolModel>? schools,
    String? username,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      schools: schools ?? this.schools as List<SchoolModel>?,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schools': schools?.map((x) => (x as SchoolModel).toMap()).toList(),
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final schools = List.from(map['schools'] ?? []);
    return UserModel(
      id: map['id'],
      name: map['name'],
      schools: List<SchoolModel>.from(
        schools.map((x) => SchoolModel.fromMap(x)),
      ),
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''UserModel(id: $id, name: $name, schools: $schools, username: $username)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        listEquals(other.schools, schools) &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ schools.hashCode ^ username.hashCode;
  }
}

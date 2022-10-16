import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/classroom.dart';

class ClassroomModel extends Classroom {
  ClassroomModel({
    required super.id,
    required super.name,
  });

  ClassroomModel copyWith({
    String? id,
    String? name,
  }) {
    return ClassroomModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ClassroomModel.fromMap(Map<String, dynamic> map) {
    return ClassroomModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory ClassroomModel.fromJson(String source) => ClassroomModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() => 'ClassroomModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassroomModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

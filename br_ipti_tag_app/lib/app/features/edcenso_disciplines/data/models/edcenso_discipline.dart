import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';

class EdcensoDisciplineModel extends EdcensoDiscipline {
  EdcensoDisciplineModel({required super.id, required super.name});
  EdcensoDiscipline copyWith({
    int? id,
    String? name,
  }) {
    return EdcensoDisciplineModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory EdcensoDisciplineModel.fromMap(Map<String, dynamic> map) {
    return EdcensoDisciplineModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EdcensoDisciplineModel.fromJson(String source) =>
      EdcensoDisciplineModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'EdcensoDiscipline(id: $id, name: $name)';

  @override
  bool operator ==(covariant EdcensoDiscipline other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

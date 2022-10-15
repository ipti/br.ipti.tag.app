import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/entities/edcenso_city.dart';

class EdCensoCityModel extends EdCensoCity {
  EdCensoCityModel({
    required super.id,
    super.oldId,
    required super.name,
    super.cepInitial,
    super.cepFinal,
    super.ddd1,
    super.ddd2,
    super.edcensoUfId,
  });

  EdCensoCityModel copyWith({
    String? id,
    String? oldId,
    String? name,
    String? cepInitial,
    String? cepFinal,
    String? ddd1,
    String? ddd2,
    String? edcensoUfId,
  }) {
    return EdCensoCityModel(
      id: id ?? this.id,
      oldId: oldId ?? this.oldId,
      name: name ?? this.name,
      cepInitial: cepInitial ?? this.cepInitial,
      cepFinal: cepFinal ?? this.cepFinal,
      ddd1: ddd1 ?? this.ddd1,
      ddd2: ddd2 ?? this.ddd2,
      edcensoUfId: edcensoUfId ?? this.edcensoUfId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'old_id': oldId,
      'name': name,
      'cep_initial': cepInitial,
      'cep_final': cepFinal,
      'ddd1': ddd1,
      'ddd2': ddd2,
      'edcensoUfId': edcensoUfId,
    };
  }

  factory EdCensoCityModel.fromMap(Map<String, dynamic> map) {
    return EdCensoCityModel(
      id: map['_id'],
      oldId: map['old_id'],
      name: map['name'],
      cepInitial: map['cep_initial'],
      cepFinal: map['cep_final'],
      ddd1: map['ddd1'],
      ddd2: map['ddd2'],
      edcensoUfId: map['edcensoUfId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EdCensoCityModel.fromJson(String source) =>
      EdCensoCityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''EdCensoCityModel(id: $id, oldId: $oldId, name: $name, cepInitial: $cepInitial, cepFinal: $cepFinal, ddd1: $ddd1, ddd2: $ddd2, edcensoUfId: $edcensoUfId)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EdCensoCityModel &&
        other.id == id &&
        other.oldId == oldId &&
        other.name == name &&
        other.cepInitial == cepInitial &&
        other.cepFinal == cepFinal &&
        other.ddd1 == ddd1 &&
        other.ddd2 == ddd2 &&
        other.edcensoUfId == edcensoUfId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        oldId.hashCode ^
        name.hashCode ^
        cepInitial.hashCode ^
        cepFinal.hashCode ^
        ddd1.hashCode ^
        ddd2.hashCode ^
        edcensoUfId.hashCode;
  }
}

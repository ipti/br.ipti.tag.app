import 'dart:convert';

class EdCensoUfModel {
  final String? id;
  final String? oldId;
  final String? name;
  final String? acronym;

  EdCensoUfModel({
    this.id,
    this.oldId,
    this.name,
    this.acronym,
  });

  EdCensoUfModel copyWith({
    String? id,
    String? oldId,
    String? name,
    String? acronym,
  }) {
    return EdCensoUfModel(
      id: id ?? this.id,
      oldId: oldId ?? this.oldId,
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'old_id': oldId,
      'name': name,
      'acronym': acronym,
    };
  }

  factory EdCensoUfModel.fromMap(Map<String, dynamic> map) {
    return EdCensoUfModel(
      id: map['id'],
      oldId: map['old_id'],
      name: map['name'],
      acronym: map['acronym'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EdCensoUfModel.fromJson(String source) =>
      EdCensoUfModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EdCensoUfModel(id: $id, oldId: $oldId, name: $name, acronym: $acronym)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EdCensoUfModel &&
        other.id == id &&
        other.oldId == oldId &&
        other.name == name &&
        other.acronym == acronym;
  }

  @override
  int get hashCode {
    return id.hashCode ^ oldId.hashCode ^ name.hashCode ^ acronym.hashCode;
  }
}

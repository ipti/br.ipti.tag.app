import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';

class EdcensoDisciplineModel extends EdcensoDisciplinesEntity {
  EdcensoDisciplineModel({
    required super.id,
    required super.name,
  });

  factory EdcensoDisciplineModel.fromJson(Map<String, dynamic> map) {
    return EdcensoDisciplineModel(id: map['_id'], name: map['name']);
  }
}

import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';

class InstructorModel extends InstructorEntity {
  InstructorModel({
    required super.id,
    required super.name,
    required super.schoolInepIdFk,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> map) {
    return InstructorModel(
      id: map['_id'],
      name: map['name'],
      schoolInepIdFk: map['school_inep_id_fk'],
    );
  }
}

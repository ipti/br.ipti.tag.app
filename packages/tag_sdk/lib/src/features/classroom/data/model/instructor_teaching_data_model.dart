import 'package:tag_sdk/src/features/classroom/domain/entities/instructors_teaching_data_entity.dart';

class InstructorTeachingDataModel extends InstructorTeachingDataEntity {
  InstructorTeachingDataModel({
    required super.instructorId,
    required super.disciplineId,
    required super.instructorFk,
    required super.role,
    required super.contractType,
  });

  factory InstructorTeachingDataModel.fromJson(Map<String, dynamic> map) {
    return InstructorTeachingDataModel(
      instructorId: map['_id'],
      disciplineId: map['discipline_1_fk'],
      instructorFk: map['instructor_fk'],
      contractType: map['contract_type'],
      role: map['role'],
    );
  }
}

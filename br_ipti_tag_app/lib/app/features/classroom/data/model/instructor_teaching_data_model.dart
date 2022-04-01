import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_teaching_data_entity.dart';

class InstructorTeachingDataModel extends InstructorTeachingDataEntity {
  InstructorTeachingDataModel(
      {required String instructorId,
      required String disciplineId,
      required String instructorFk,
      required int role,
      required int contractType})
      : super(
            instructorId: instructorId,
            disciplineId: disciplineId,
            instructorFk: instructorFk,
            contractType: contractType,
            role: role);

  factory InstructorTeachingDataModel.fromJson(Map<String, dynamic> map) {
    return InstructorTeachingDataModel(
        instructorId: map['_id'],
        disciplineId: map['discipline_1_fk'],
        instructorFk: map['instructor_fk'],
        contractType: map['contract_type'],
        role: map['role']);
  }
}

import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';

class InstructorTeachingDataCreateModel
    extends InstructorTeachingDataCreateEntity {
  InstructorTeachingDataCreateModel({
    required super.schoolInepIdFk,
    required super.instructorFk,
    super.classroomInepId,
    required super.classroomIdFk,
    super.role,
    required super.contractType,
    required super.discipline1Fk,
    super.discipline2Fk,
    super.discipline3Fk,
    super.discipline4Fk,
    super.discipline5Fk,
    super.discipline6Fk,
    super.discipline7Fk,
    super.discipline8Fk,
    super.discipline9Fk,
    super.discipline10Fk,
    super.discipline11Fk,
    super.discipline12Fk,
    super.discipline13Fk,
    super.discipline14Fk,
    super.discipline15Fk,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        "school_inep_id_fk": schoolInepIdFk,
        "instructor_fk": instructorFk,
        "classroom_inep_id": classroomInepId,
        "classroom_id_fk": classroomIdFk,
        "role": role,
        "contract_type": contractType,
        "discipline_1_fk": discipline1Fk,
        "discipline_2_fk": discipline2Fk,
        "discipline_3_fk": discipline3Fk,
        "discipline_4_fk": discipline4Fk,
        "discipline_5_fk": discipline5Fk,
        "discipline_6_fk": discipline6Fk,
        "discipline_7_fk": discipline7Fk,
        "discipline_8_fk": discipline8Fk,
        "discipline_9_fk": discipline9Fk,
        "discipline_10_fk": discipline10Fk,
        "discipline_11_fk": discipline11Fk,
        "discipline_12_fk": discipline12Fk,
        "discipline_13_fk": discipline13Fk,
        "discipline_14_fk": discipline14Fk,
        "discipline_15_fk": discipline15Fk
      };
}

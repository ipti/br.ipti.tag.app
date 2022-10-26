import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_create_model.dart';

class InstructorTeachingDataCreateEntity {
  String schoolInepIdFk;
  String instructorFk;
  String? classroomInepId;
  String classroomIdFk;
  int role;
  int contractType;
  String discipline1Fk;
  String? discipline2Fk;
  String? discipline3Fk;
  String? discipline4Fk;
  String? discipline5Fk;
  String? discipline6Fk;
  String? discipline7Fk;
  String? discipline8Fk;
  String? discipline9Fk;
  String? discipline10Fk;
  String? discipline11Fk;
  String? discipline12Fk;
  String? discipline13Fk;
  String? discipline14Fk;
  String? discipline15Fk;
  InstructorTeachingDataCreateEntity({
    required this.schoolInepIdFk,
    required this.instructorFk,
    this.classroomInepId,
    required this.classroomIdFk,
    this.role = 0,
    required this.contractType,
    required this.discipline1Fk,
    this.discipline2Fk,
    this.discipline3Fk,
    this.discipline4Fk,
    this.discipline5Fk,
    this.discipline6Fk,
    this.discipline7Fk,
    this.discipline8Fk,
    this.discipline9Fk,
    this.discipline10Fk,
    this.discipline11Fk,
    this.discipline12Fk,
    this.discipline13Fk,
    this.discipline14Fk,
    this.discipline15Fk,
  });

  InstructorTeachingDataCreateModel fromEntity() =>
      InstructorTeachingDataCreateModel(
        schoolInepIdFk: schoolInepIdFk,
        instructorFk: instructorFk,
        classroomInepId: classroomInepId,
        classroomIdFk: classroomIdFk,
        role: role,
        contractType: contractType,
        discipline1Fk: discipline1Fk,
        discipline2Fk: discipline2Fk,
        discipline3Fk: discipline3Fk,
        discipline4Fk: discipline4Fk,
        discipline5Fk: discipline5Fk,
        discipline6Fk: discipline6Fk,
        discipline7Fk: discipline7Fk,
        discipline8Fk: discipline8Fk,
        discipline9Fk: discipline9Fk,
        discipline10Fk: discipline10Fk,
        discipline11Fk: discipline11Fk,
        discipline12Fk: discipline12Fk,
        discipline13Fk: discipline13Fk,
        discipline14Fk: discipline14Fk,
        discipline15Fk: discipline15Fk,
      );
}

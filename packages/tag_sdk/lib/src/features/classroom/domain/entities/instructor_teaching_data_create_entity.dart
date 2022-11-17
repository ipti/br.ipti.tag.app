import 'package:tag_sdk/src/features/classroom/data/model/instructor_teaching_data_create_model.dart';

class InstructorTeachingDataCreateEntity {
  int schoolInepIdFk;
  int instructorFk;
  int? classroomInepId;
  int classroomIdFk;
  int role;
  int contractType;
  int discipline1Fk;
  int? discipline2Fk;
  int? discipline3Fk;
  int? discipline4Fk;
  int? discipline5Fk;
  int? discipline6Fk;
  int? discipline7Fk;
  int? discipline8Fk;
  int? discipline9Fk;
  int? discipline10Fk;
  int? discipline11Fk;
  int? discipline12Fk;
  int? discipline13Fk;
  int? discipline14Fk;
  int? discipline15Fk;
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

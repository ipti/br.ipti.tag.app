import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';

class InstructorTeachingDataUpdateModel
    extends InstructorTeachingDataUpdateEntity {
  InstructorTeachingDataUpdateModel({
    super.role,
    super.contractType,
    super.discipline1Fk,
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
        'role': role,
        'contract_type': contractType,
        'discipline1Fk': discipline1Fk,
        'discipline2Fk': discipline2Fk,
        'discipline3Fk': discipline3Fk,
        'discipline4Fk': discipline4Fk,
        'discipline5Fk': discipline5Fk,
        'discipline6Fk': discipline6Fk,
        'discipline7Fk': discipline7Fk,
        'discipline8Fk': discipline8Fk,
        'discipline9Fk': discipline9Fk,
        'discipline10Fk': discipline10Fk,
        'discipline11Fk': discipline11Fk,
        'discipline12Fk': discipline12Fk,
        'discipline13Fk': discipline13Fk,
        'discipline14Fk': discipline14Fk,
        'discipline15Fk': discipline15Fk,
      };
}

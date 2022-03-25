import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_update_model.dart';

class InstructorTeachingDataUpdateEntity {
  int? role;
  int? contract_type;
  String? discipline1Fk;
  InstructorTeachingDataUpdateEntity({
    this.role = 0,
    this.contract_type = 0,
    this.discipline1Fk,
  });

  InstructorTeachingDataUpdateModel fromEntity() =>
      InstructorTeachingDataUpdateModel(
        role,
        contract_type,
        discipline1Fk,
      );
}

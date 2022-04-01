import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';

class InstructorTeachingDataUpdateModel
    extends InstructorTeachingDataUpdateEntity {
  InstructorTeachingDataUpdateModel(
      int? role, int? contract_type, String? discipline1Fk)
      : super(
            role: role,
            contract_type: contract_type,
            discipline1Fk: discipline1Fk);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "role": role,
        "contract_type": contract_type,
        "discipline_1_fk": discipline1Fk
      };
}

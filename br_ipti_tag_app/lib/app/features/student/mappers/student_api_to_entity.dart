import 'package:br_ipti_tag_app/app/api/students/student_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/deficiency.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';

class StudentApiToEntityMapper extends CoreMapper<StudentResponse, Student> {
  @override
  Student call(StudentResponse param) {
    late Deficiency deficiency;

    if (param.deficiency) {
      deficiency = _buildDeficiency(param);
    }
    return Student(
      name: param.name,
      deficiency: param.deficiency,
      deficiencies: deficiency,
    );
  }

  Deficiency _buildDeficiency(StudentResponse param) {
    return Deficiency(
        deficiencyTypeBlindness: param.deficiencyTypeBlindness,
        deficiencyTypeLowVision: param.deficiencyTypeLowVision,
        deficiencyTypeDeafness: param.deficiencyTypeDeafness,
        deficiencyTypeDisabilityHearing: param.deficiencyTypeDisabilityHearing,
        deficiencyTypeDeafblindness: param.deficiencyTypeDeafblindness,
        deficiencyTypePhisicalDisability:
            param.deficiencyTypePhisicalDisability,
        deficiencyTypeIntelectualDisability:
            param.deficiencyTypeIntelectualDisability,
        deficiencyTypeMultipleDisabilities:
            param.deficiencyTypeMultipleDisabilities,
        deficiencyTypeAutism: param.deficiencyTypeAutism,
        deficiencyTypeAspengerSyndrome: param.deficiencyTypeAspengerSyndrome,
        deficiencyTypeRettSyndrome: param.deficiencyTypeRettSyndrome,
        deficiencyTypeChildhoodDisintegrativeDisorder:
            param.deficiencyTypeChildhoodDisintegrativeDisorder,
        deficiencyTypeGifted: param.deficiencyTypeGifted);
  }
}

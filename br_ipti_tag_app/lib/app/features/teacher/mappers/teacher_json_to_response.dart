import 'package:br_ipti_tag_app/app/api/instructor/instructor_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';

class TeacherJsonToMapMapper
    extends CoreMapper<Map<String, dynamic>, InstructorResponse> {
  @override
  InstructorResponse call(Map<String, dynamic> map) {
    return InstructorResponse(
      registerType: map['registerType'] as String,
      schoolInepIdFk: map['schoolInepIdFk'] as String,
      inepId: map['inepId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      nis: map['nis'] as String,
      birthdayDate: map['birthdayDate'] as String,
      sex: map['sex'] as int,
      colorRace: map['colorRace'] as int,
      filiation: map['filiation'] as bool,
      filiation1: map['filiation1'] as String,
      filiation2: map['filiation2'] as String,
      nationality: map['nationality'] as int,
      edcensoNationFk: map['edcensoNationFk'] as int,
      edcensoUfFk: map['edcensoUfFk'] as int,
      edcensoCityFk: map['edcensoCityFk'] as int,
      deficiency: map['deficiency'] as bool,
      deficiencyTypeBlindness: map['deficiencyTypeBlindness'] as bool,
      deficiencyTypeLowVision: map['deficiencyTypeLowVision'] as bool,
      deficiencyTypeDeafness: map['deficiencyTypeDeafness'] as bool,
      deficiencyTypeDisabilityHearing:
          map['deficiencyTypeDisabilityHearing'] as bool,
      deficiencyTypeDeafblindness: map['deficiencyTypeDeafblindness'] as bool,
      deficiencyTypePhisicalDisability:
          map['deficiencyTypePhisicalDisability'] as bool,
      deficiencyTypeIntelectualDisability:
          map['deficiencyTypeIntelectualDisability'] as bool,
      deficiencyTypeMultipleDisabilities:
          map['deficiencyTypeMultipleDisabilities'] as bool,
      deficiencyTypeAutism: map['deficiencyTypeAutism'] as bool,
      deficiencyTypeGifted: map['deficiencyTypeGifted'] as bool,
      hash: map['hash'] as int,
    );
  }
}

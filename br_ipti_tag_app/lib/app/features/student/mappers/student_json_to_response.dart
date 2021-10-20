import 'package:br_ipti_tag_app/app/api/students/student_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';

class StudentJsonToMapMapper
    extends CoreMapper<Map<String, dynamic>, StudentResponse> {
  @override
  StudentResponse call(Map<String, dynamic> map) {
    return StudentResponse(
      name: map['name'] as String,
      registerType: map['register_type'] as String,
      schoolInepIdFk: map['schoolInepIdFk'] as String,
      inepId: map['inep_id'] as String,
      birthday: map['birthday'] as String,
      sex: map['sex'] as int,
      colorRace: map['color_race'] as int,
      filiation: map['filiation'] as int,
      filiation1: map['filiation1'] as String,
      filiation2: map['filiation2'] as String,
      nationality: map['nationality'] as int,
      noDocumentDesc: map['noDocumentDesc'] as int,
      scholarity: map['scholarity'] as int,
      idEmail: map['idEmail'] as String,
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
      deficiencyTypeAspengerSyndrome:
          map['deficiencyTypeAspengerSyndrome'] as bool,
      deficiencyTypeRettSyndrome: map['deficiencyTypeRettSyndrome'] as bool,
      deficiencyTypeChildhoodDisintegrativeDisorder:
          map['deficiencyTypeChildhoodDisintegrativeDisorder'] as bool,
      deficiencyTypeGifted: map['deficiencyTypeGifted'] as bool,
      resourceAidLector: map['resourceAidLector'] as bool,
      resourceAidTranscription: map['resourceAidTranscription'] as bool,
      resourceInterpreterGuide: map['resourceInterpreterGuide'] as bool,
      resourceInterpreterLibras: map['resourceInterpreterLibras'] as bool,
      resourceLipReading: map['resourceLipReading'] as bool,
      resourceZoomedTest16: map['resourceZoomedTest16'] as bool,
      resourceZoomedTest18: map['resourceZoomedTest18'] as bool,
      resourceZoomedTest20: map['resourceZoomedTest20'] as bool,
      resourceZoomedTest24: map['resourceZoomedTest24'] as bool,
      resourceCdAudio: map['resourceCdAudio'] as bool,
      resourceProofLanguage: map['resourceProofLanguage'] as bool,
      resourceVideoLibras: map['resourceVideoLibras'] as bool,
      resourceBrailleTest: map['resourceBrailleTest'] as bool,
      resourceNone: map['resourceNone'] as bool,
      sendYear: map['sendYear'] as int,
      lastChange: map['lastChange'] as String,
      responsable: map['responsable'] as int,
      responsableName: map['responsableName'] as String,
      responsableRg: map['responsableRg'] as String,
      responsableCpf: map['responsableCpf'] as String,
      responsableScholarity: map['responsableScholarity'] as int,
      responsableJob: map['responsableJob'] as String,
      bfParticipator: map['bfParticipator'] as bool,
      foodRestrictions: map['foodRestrictions'] as String,
      responsableTelephone: map['responsableTelephone'] as String,
      hash: map['hash'] as int,
      filiation1Rg: map['filiation1Rg'] as String,
      filiation1Cpf: map['filiation1Cpf'] as String,
      filiation1Scholarity: map['filiation1Scholarity'] as int,
      filiation1Job: map['filiation1Job'] as String,
      filiation2Rg: map['filiation2Rg'] as String,
      filiation2Cpf: map['filiation2Cpf'] as String,
      filiation2Scholarity: map['filiation2Scholarity'] as int,
      filiation2Job: map['filiation2Job'] as String,
    );
  }
}

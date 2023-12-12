import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class StudentIdentification with _$StudentIdentification {
  const factory StudentIdentification({
    String? registerType,
    String? schoolInepIdFk,
    String? inepId,
    int? id,
    String? name,
    String? birthday,
    int? sex,
    int? colorRace,
    int? filiation,
    String? filiation1,
    String? filiation2,
    int? nationality,
    int? noDocumentDesc,
    int? scholarity,
    String? idEmail,
    int? edcensoNationFk,
    int? edcensoUfFk,
    int? edcensoCityFk,
    // bool? deficiency,
    // bool? deficiencyTypeBlindness,
    // bool? deficiencyTypeLowVision,
    // bool? deficiencyTypeDeafness,
    // bool? deficiencyTypeDisabilityHearing,
    // bool? deficiencyTypeDeafblindness,
    // bool? deficiencyTypePhisicalDisability,
    // bool? deficiencyTypeIntelectualDisability,
    // bool? deficiencyTypeMultipleDisabilities,
    // bool? deficiencyTypeAutism,
    // bool? deficiencyTypeAspengerSyndrome,
    // bool? deficiencyTypeRettSyndrome,
    // bool? deficiencyTypeChildhoodDisintegrativeDisorder,
    // bool? deficiencyTypeGifted,
    // bool? resourceAidLector,
    // bool? resourceAidTranscription,
    // bool? resourceInterpreterGuide,
    // bool? resourceInterpreterLibras,
    // bool? resourceLipReading,
    // bool? resourceZoomedTest16,
    // bool? resourceZoomedTest18,
    // bool? resourceZoomedTest20,
    // bool? resourceZoomedTest24,
    // bool? resourceCdAudio,
    // bool? resourceProofLanguage,
    // bool? resourceVideoLibras,
    // bool? resourceBrailleTest,
    // bool? resourceNone,
    int? sendYear,
    String? lastChange,
    int? responsable,
    String? responsableName,
    String? responsableRg,
    String? responsableCpf,
    int? responsableScholarity,
    String? responsableJob,
    // bool? bfParticipator,
    String? foodRestrictions,
    String? responsableTelephone,
    int? hash,
    String? filiation1Rg,
    String? filiation1Cpf,
    int? filiation1Scholarity,
    String? filiation1Job,
    String? filiation2Rg,
    String? filiation2Cpf,
    int? filiation2Scholarity,
    String? filiation2Job,
  }) = _StudentIdentification;

  factory StudentIdentification.fromJson(Map<String, Object?> json) =>
      _$StudentIdentificationFromJson(json);

  //empty

}

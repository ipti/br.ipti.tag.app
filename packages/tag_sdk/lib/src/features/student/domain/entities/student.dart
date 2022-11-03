import 'package:equatable/equatable.dart';

class Student extends Equatable {
  Student({
    this.id,
    this.name,
    this.nis,
    this.schoolIdentification,
    this.edcensoDistrictFk,
    this.registerType,
    this.inepId,
    this.birthday,
    this.sex,
    this.colorRace,
    this.filiation,
    this.filiation1,
    this.filiation2,
    this.nationality,
    this.noDocumentDesc,
    this.scholarity,
    this.idEmail,
    this.edcensoNationFk,
    this.edcensoUfFk,
    this.edcensoCityFk,
    this.deficiency,
    this.deficiencyTypeBlindness,
    this.deficiencyTypeLowVision,
    this.deficiencyTypeDeafness,
    this.deficiencyTypeDisabilityHearing,
    this.deficiencyTypeDeafblindness,
    this.deficiencyTypePhisicalDisability,
    this.deficiencyTypeIntelectualDisability,
    this.deficiencyTypeMultipleDisabilities,
    this.deficiencyTypeAutism,
    this.deficiencyTypeAspengerSyndrome,
    this.deficiencyTypeRettSyndrome,
    this.deficiencyTypeChildhoodDisintegrativeDisorder,
    this.deficiencyTypeGifted,
    this.resourceAidLector,
    this.resourceAidTranscription,
    this.resourceInterpreterGuide,
    this.resourceInterpreterLibras,
    this.resourceLipReading,
    this.resourceZoomedTest16,
    this.resourceZoomedTest18,
    this.resourceZoomedTest20,
    this.resourceZoomedTest24,
    this.resourceCdAudio,
    this.resourceProofLanguage,
    this.resourceVideoLibras,
    this.resourceBrailleTest,
    this.resourceNone,
    this.sendYear,
    this.lastChange,
    this.responsable,
    this.responsableName,
    this.responsableRg,
    this.responsableCpf,
    this.responsableScholarity,
    this.responsableJob,
    this.bfParticipator,
    this.foodRestrictions,
    this.responsableTelephone,
    this.hash,
    this.filiation1Rg,
    this.filiation1Cpf,
    this.filiation1Scholarity,
    this.filiation1Job,
    this.filiation2Rg,
    this.filiation2Cpf,
    this.filiation2Scholarity,
    this.filiation2Job,
  });

  final int? id;
  final String? name;
  final String? nis;
  final String? schoolIdentification;
  final int? edcensoDistrictFk;
  final String? registerType;
  final String? inepId;
  final String? birthday;
  final int? sex;
  final int? colorRace;
  final int? filiation;
  final String? filiation1;
  final String? filiation2;
  final int? nationality;
  final int? noDocumentDesc;
  final int? scholarity;
  final String? idEmail;
  final int? edcensoNationFk;
  final int? edcensoUfFk;
  final int? edcensoCityFk;
  final bool? deficiency;
  final bool? deficiencyTypeBlindness;
  final bool? deficiencyTypeLowVision;
  final bool? deficiencyTypeDeafness;
  final bool? deficiencyTypeDisabilityHearing;
  final bool? deficiencyTypeDeafblindness;
  final bool? deficiencyTypePhisicalDisability;
  final bool? deficiencyTypeIntelectualDisability;
  final bool? deficiencyTypeMultipleDisabilities;
  final bool? deficiencyTypeAutism;
  final bool? deficiencyTypeAspengerSyndrome;
  final bool? deficiencyTypeRettSyndrome;
  final bool? deficiencyTypeChildhoodDisintegrativeDisorder;
  final bool? deficiencyTypeGifted;
  final bool? resourceAidLector;
  final bool? resourceAidTranscription;
  final bool? resourceInterpreterGuide;
  final bool? resourceInterpreterLibras;
  final bool? resourceLipReading;
  final bool? resourceZoomedTest16;
  final bool? resourceZoomedTest18;
  final bool? resourceZoomedTest20;
  final bool? resourceZoomedTest24;
  final bool? resourceCdAudio;
  final bool? resourceProofLanguage;
  final bool? resourceVideoLibras;
  final bool? resourceBrailleTest;
  final bool? resourceNone;
  final int? sendYear;
  final String? lastChange;
  final int? responsable;
  final String? responsableName;
  final String? responsableRg;
  final String? responsableCpf;
  final int? responsableScholarity;
  final String? responsableJob;
  final bool? bfParticipator;
  final String? foodRestrictions;
  final String? responsableTelephone;
  final int? hash;
  final String? filiation1Rg;
  final String? filiation1Cpf;
  final int? filiation1Scholarity;
  final String? filiation1Job;
  final String? filiation2Rg;
  final String? filiation2Cpf;
  final int? filiation2Scholarity;
  final String? filiation2Job;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      nis,
      edcensoDistrictFk,
      registerType,
      inepId,
      birthday,
      sex,
      colorRace,
      filiation,
      filiation1,
      filiation2,
      nationality,
      noDocumentDesc,
      scholarity,
      idEmail,
      edcensoNationFk,
      edcensoUfFk,
      edcensoCityFk,
      deficiency,
      deficiencyTypeBlindness,
      deficiencyTypeLowVision,
      deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism,
      deficiencyTypeAspengerSyndrome,
      deficiencyTypeRettSyndrome,
      deficiencyTypeChildhoodDisintegrativeDisorder,
      deficiencyTypeGifted,
      resourceAidLector,
      resourceAidTranscription,
      resourceInterpreterGuide,
      resourceInterpreterLibras,
      resourceLipReading,
      resourceZoomedTest16,
      resourceZoomedTest18,
      resourceZoomedTest20,
      resourceZoomedTest24,
      resourceCdAudio,
      resourceProofLanguage,
      resourceVideoLibras,
      resourceBrailleTest,
      resourceNone,
      sendYear,
      lastChange,
      responsable,
      responsableName,
      responsableRg,
      responsableCpf,
      responsableScholarity,
      responsableJob,
      bfParticipator,
      foodRestrictions,
      responsableTelephone,
      hash,
      filiation1Rg,
      filiation1Cpf,
      filiation1Scholarity,
      filiation1Job,
      filiation2Rg,
      filiation2Cpf,
      filiation2Scholarity,
      filiation2Job,
    ];
  }

  Student copyWith({
    int? id,
    String? name,
    String? nis,
    String? schoolIdentification,
    int? edcensoDistrictFk,
    String? registerType,
    String? inepId,
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
    bool? deficiency,
    bool? deficiencyTypeBlindness,
    bool? deficiencyTypeLowVision,
    bool? deficiencyTypeDeafness,
    bool? deficiencyTypeDisabilityHearing,
    bool? deficiencyTypeDeafblindness,
    bool? deficiencyTypePhisicalDisability,
    bool? deficiencyTypeIntelectualDisability,
    bool? deficiencyTypeMultipleDisabilities,
    bool? deficiencyTypeAutism,
    bool? deficiencyTypeAspengerSyndrome,
    bool? deficiencyTypeRettSyndrome,
    bool? deficiencyTypeChildhoodDisintegrativeDisorder,
    bool? deficiencyTypeGifted,
    bool? resourceAidLector,
    bool? resourceAidTranscription,
    bool? resourceInterpreterGuide,
    bool? resourceInterpreterLibras,
    bool? resourceLipReading,
    bool? resourceZoomedTest16,
    bool? resourceZoomedTest18,
    bool? resourceZoomedTest20,
    bool? resourceZoomedTest24,
    bool? resourceCdAudio,
    bool? resourceProofLanguage,
    bool? resourceVideoLibras,
    bool? resourceBrailleTest,
    bool? resourceNone,
    int? sendYear,
    String? lastChange,
    int? responsable,
    String? responsableName,
    String? responsableRg,
    String? responsableCpf,
    int? responsableScholarity,
    String? responsableJob,
    bool? bfParticipator,
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
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      nis: nis ?? this.nis,
      schoolIdentification: schoolIdentification ?? this.schoolIdentification,
      edcensoDistrictFk: edcensoDistrictFk ?? this.edcensoDistrictFk,
      registerType: registerType ?? this.registerType,
      inepId: inepId ?? this.inepId,
      birthday: birthday ?? this.birthday,
      sex: sex ?? this.sex,
      colorRace: colorRace ?? this.colorRace,
      filiation: filiation ?? this.filiation,
      filiation1: filiation1 ?? this.filiation1,
      filiation2: filiation2 ?? this.filiation2,
      nationality: nationality ?? this.nationality,
      noDocumentDesc: noDocumentDesc ?? this.noDocumentDesc,
      scholarity: scholarity ?? this.scholarity,
      idEmail: idEmail ?? this.idEmail,
      edcensoNationFk: edcensoNationFk ?? this.edcensoNationFk,
      edcensoUfFk: edcensoUfFk ?? this.edcensoUfFk,
      edcensoCityFk: edcensoCityFk ?? this.edcensoCityFk,
      deficiency: deficiency ?? this.deficiency,
      deficiencyTypeBlindness:
          deficiencyTypeBlindness ?? this.deficiencyTypeBlindness,
      deficiencyTypeLowVision:
          deficiencyTypeLowVision ?? this.deficiencyTypeLowVision,
      deficiencyTypeDeafness:
          deficiencyTypeDeafness ?? this.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing: deficiencyTypeDisabilityHearing ??
          this.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness:
          deficiencyTypeDeafblindness ?? this.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability: deficiencyTypePhisicalDisability ??
          this.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          deficiencyTypeIntelectualDisability ??
              this.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities: deficiencyTypeMultipleDisabilities ??
          this.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: deficiencyTypeAutism ?? this.deficiencyTypeAutism,
      deficiencyTypeAspengerSyndrome:
          deficiencyTypeAspengerSyndrome ?? this.deficiencyTypeAspengerSyndrome,
      deficiencyTypeRettSyndrome:
          deficiencyTypeRettSyndrome ?? this.deficiencyTypeRettSyndrome,
      deficiencyTypeChildhoodDisintegrativeDisorder:
          deficiencyTypeChildhoodDisintegrativeDisorder ??
              this.deficiencyTypeChildhoodDisintegrativeDisorder,
      deficiencyTypeGifted: deficiencyTypeGifted ?? this.deficiencyTypeGifted,
      resourceAidLector: resourceAidLector ?? this.resourceAidLector,
      resourceAidTranscription:
          resourceAidTranscription ?? this.resourceAidTranscription,
      resourceInterpreterGuide:
          resourceInterpreterGuide ?? this.resourceInterpreterGuide,
      resourceInterpreterLibras:
          resourceInterpreterLibras ?? this.resourceInterpreterLibras,
      resourceLipReading: resourceLipReading ?? this.resourceLipReading,
      resourceZoomedTest16: resourceZoomedTest16 ?? this.resourceZoomedTest16,
      resourceZoomedTest18: resourceZoomedTest18 ?? this.resourceZoomedTest18,
      resourceZoomedTest20: resourceZoomedTest20 ?? this.resourceZoomedTest20,
      resourceZoomedTest24: resourceZoomedTest24 ?? this.resourceZoomedTest24,
      resourceCdAudio: resourceCdAudio ?? this.resourceCdAudio,
      resourceProofLanguage:
          resourceProofLanguage ?? this.resourceProofLanguage,
      resourceVideoLibras: resourceVideoLibras ?? this.resourceVideoLibras,
      resourceBrailleTest: resourceBrailleTest ?? this.resourceBrailleTest,
      resourceNone: resourceNone ?? this.resourceNone,
      sendYear: sendYear ?? this.sendYear,
      lastChange: lastChange ?? this.lastChange,
      responsable: responsable ?? this.responsable,
      responsableName: responsableName ?? this.responsableName,
      responsableRg: responsableRg ?? this.responsableRg,
      responsableCpf: responsableCpf ?? this.responsableCpf,
      responsableScholarity:
          responsableScholarity ?? this.responsableScholarity,
      responsableJob: responsableJob ?? this.responsableJob,
      bfParticipator: bfParticipator ?? this.bfParticipator,
      foodRestrictions: foodRestrictions ?? this.foodRestrictions,
      responsableTelephone: responsableTelephone ?? this.responsableTelephone,
      hash: hash ?? this.hash,
      filiation1Rg: filiation1Rg ?? this.filiation1Rg,
      filiation1Cpf: filiation1Cpf ?? this.filiation1Cpf,
      filiation1Scholarity: filiation1Scholarity ?? this.filiation1Scholarity,
      filiation1Job: filiation1Job ?? this.filiation1Job,
      filiation2Rg: filiation2Rg ?? this.filiation2Rg,
      filiation2Cpf: filiation2Cpf ?? this.filiation2Cpf,
      filiation2Scholarity: filiation2Scholarity ?? this.filiation2Scholarity,
      filiation2Job: filiation2Job ?? this.filiation2Job,
    );
  }
}

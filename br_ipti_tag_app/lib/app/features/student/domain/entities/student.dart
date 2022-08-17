class Student {
  Student(
      {this.id,
      this.name,
      this.nis,
      this.edcensoDistrictFk,
      this.registerType,
      this.schoolInepIdFk,
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
      this.filiation2Job});

  final String? id;
  final String? name;
  final String? nis;
  final String? edcensoDistrictFk;
  final String? registerType;
  final String? schoolInepIdFk;
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
  final String? edcensoNationFk;
  final String? edcensoUfFk;
  final String? edcensoCityFk;
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Student &&
        other.id == id &&
        other.name == name &&
        other.nis == nis &&
        other.edcensoDistrictFk == edcensoDistrictFk &&
        other.registerType == registerType &&
        other.schoolInepIdFk == schoolInepIdFk &&
        other.inepId == inepId &&
        other.birthday == birthday &&
        other.sex == sex &&
        other.colorRace == colorRace &&
        other.filiation == filiation &&
        other.filiation1 == filiation1 &&
        other.filiation2 == filiation2 &&
        other.nationality == nationality &&
        other.noDocumentDesc == noDocumentDesc &&
        other.scholarity == scholarity &&
        other.idEmail == idEmail &&
        other.edcensoNationFk == edcensoNationFk &&
        other.edcensoUfFk == edcensoUfFk &&
        other.edcensoCityFk == edcensoCityFk &&
        other.deficiency == deficiency &&
        other.deficiencyTypeBlindness == deficiencyTypeBlindness &&
        other.deficiencyTypeLowVision == deficiencyTypeLowVision &&
        other.deficiencyTypeDeafness == deficiencyTypeDeafness &&
        other.deficiencyTypeDisabilityHearing ==
            deficiencyTypeDisabilityHearing &&
        other.deficiencyTypeDeafblindness == deficiencyTypeDeafblindness &&
        other.deficiencyTypePhisicalDisability ==
            deficiencyTypePhisicalDisability &&
        other.deficiencyTypeIntelectualDisability ==
            deficiencyTypeIntelectualDisability &&
        other.deficiencyTypeMultipleDisabilities ==
            deficiencyTypeMultipleDisabilities &&
        other.deficiencyTypeAutism == deficiencyTypeAutism &&
        other.deficiencyTypeAspengerSyndrome ==
            deficiencyTypeAspengerSyndrome &&
        other.deficiencyTypeRettSyndrome == deficiencyTypeRettSyndrome &&
        other.deficiencyTypeChildhoodDisintegrativeDisorder ==
            deficiencyTypeChildhoodDisintegrativeDisorder &&
        other.deficiencyTypeGifted == deficiencyTypeGifted &&
        other.resourceAidLector == resourceAidLector &&
        other.resourceAidTranscription == resourceAidTranscription &&
        other.resourceInterpreterGuide == resourceInterpreterGuide &&
        other.resourceInterpreterLibras == resourceInterpreterLibras &&
        other.resourceLipReading == resourceLipReading &&
        other.resourceZoomedTest16 == resourceZoomedTest16 &&
        other.resourceZoomedTest18 == resourceZoomedTest18 &&
        other.resourceZoomedTest20 == resourceZoomedTest20 &&
        other.resourceZoomedTest24 == resourceZoomedTest24 &&
        other.resourceCdAudio == resourceCdAudio &&
        other.resourceProofLanguage == resourceProofLanguage &&
        other.resourceVideoLibras == resourceVideoLibras &&
        other.resourceBrailleTest == resourceBrailleTest &&
        other.resourceNone == resourceNone &&
        other.sendYear == sendYear &&
        other.lastChange == lastChange &&
        other.responsable == responsable &&
        other.responsableName == responsableName &&
        other.responsableRg == responsableRg &&
        other.responsableCpf == responsableCpf &&
        other.responsableScholarity == responsableScholarity &&
        other.responsableJob == responsableJob &&
        other.bfParticipator == bfParticipator &&
        other.foodRestrictions == foodRestrictions &&
        other.responsableTelephone == responsableTelephone &&
        other.hash == hash &&
        other.filiation1Rg == filiation1Rg &&
        other.filiation1Cpf == filiation1Cpf &&
        other.filiation1Scholarity == filiation1Scholarity &&
        other.filiation1Job == filiation1Job &&
        other.filiation2Rg == filiation2Rg &&
        other.filiation2Cpf == filiation2Cpf &&
        other.filiation2Scholarity == filiation2Scholarity &&
        other.filiation2Job == filiation2Job;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        nis.hashCode ^
        edcensoDistrictFk.hashCode ^
        registerType.hashCode ^
        schoolInepIdFk.hashCode ^
        inepId.hashCode ^
        birthday.hashCode ^
        sex.hashCode ^
        colorRace.hashCode ^
        filiation.hashCode ^
        filiation1.hashCode ^
        filiation2.hashCode ^
        nationality.hashCode ^
        noDocumentDesc.hashCode ^
        scholarity.hashCode ^
        idEmail.hashCode ^
        edcensoNationFk.hashCode ^
        edcensoUfFk.hashCode ^
        edcensoCityFk.hashCode ^
        deficiency.hashCode ^
        deficiencyTypeBlindness.hashCode ^
        deficiencyTypeLowVision.hashCode ^
        deficiencyTypeDeafness.hashCode ^
        deficiencyTypeDisabilityHearing.hashCode ^
        deficiencyTypeDeafblindness.hashCode ^
        deficiencyTypePhisicalDisability.hashCode ^
        deficiencyTypeIntelectualDisability.hashCode ^
        deficiencyTypeMultipleDisabilities.hashCode ^
        deficiencyTypeAutism.hashCode ^
        deficiencyTypeAspengerSyndrome.hashCode ^
        deficiencyTypeRettSyndrome.hashCode ^
        deficiencyTypeChildhoodDisintegrativeDisorder.hashCode ^
        deficiencyTypeGifted.hashCode ^
        resourceAidLector.hashCode ^
        resourceAidTranscription.hashCode ^
        resourceInterpreterGuide.hashCode ^
        resourceInterpreterLibras.hashCode ^
        resourceLipReading.hashCode ^
        resourceZoomedTest16.hashCode ^
        resourceZoomedTest18.hashCode ^
        resourceZoomedTest20.hashCode ^
        resourceZoomedTest24.hashCode ^
        resourceCdAudio.hashCode ^
        resourceProofLanguage.hashCode ^
        resourceVideoLibras.hashCode ^
        resourceBrailleTest.hashCode ^
        resourceNone.hashCode ^
        sendYear.hashCode ^
        lastChange.hashCode ^
        responsable.hashCode ^
        responsableName.hashCode ^
        responsableRg.hashCode ^
        responsableCpf.hashCode ^
        responsableScholarity.hashCode ^
        responsableJob.hashCode ^
        bfParticipator.hashCode ^
        foodRestrictions.hashCode ^
        responsableTelephone.hashCode ^
        hash.hashCode ^
        filiation1Rg.hashCode ^
        filiation1Cpf.hashCode ^
        filiation1Scholarity.hashCode ^
        filiation1Job.hashCode ^
        filiation2Rg.hashCode ^
        filiation2Cpf.hashCode ^
        filiation2Scholarity.hashCode ^
        filiation2Job.hashCode;
  }

  Student copyWith({
    String? id,
    String? name,
    String? nis,
    String? edcensoDistrictFk,
    String? registerType,
    String? schoolInepIdFk,
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
    String? edcensoNationFk,
    String? edcensoUfFk,
    String? edcensoCityFk,
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
      edcensoDistrictFk: edcensoDistrictFk ?? this.edcensoDistrictFk,
      registerType: registerType ?? this.registerType,
      schoolInepIdFk: schoolInepIdFk ?? this.schoolInepIdFk,
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

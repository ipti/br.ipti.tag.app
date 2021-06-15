class Student {
  String registerType;
  String schoolInepIdFk;
  String inepId;
  String name;
  String birthday;
  int sex;
  int colorRace;
  int filiation;
  String filiation1;
  String filiation2;
  int nationality;
  int noDocumentDesc;
  int scholarity;
  String idEmail;
  int edcensoNationFk;
  int edcensoUfFk;
  int edcensoCityFk;
  bool deficiency;
  bool deficiencyTypeBlindness;
  bool deficiencyTypeLowVision;
  bool deficiencyTypeDeafness;
  bool deficiencyTypeDisabilityHearing;
  bool deficiencyTypeDeafblindness;
  bool deficiencyTypePhisicalDisability;
  bool deficiencyTypeIntelectualDisability;
  bool deficiencyTypeMultipleDisabilities;
  bool deficiencyTypeAutism;
  bool deficiencyTypeAspengerSyndrome;
  bool deficiencyTypeRettSyndrome;
  bool deficiencyTypeChildhoodDisintegrativeDisorder;
  bool deficiencyTypeGifted;
  bool resourceAidLector;
  bool resourceAidTranscription;
  bool resourceInterpreterGuide;
  bool resourceInterpreterLibras;
  bool resourceLipReading;
  bool resourceZoomedTest16;
  bool resourceZoomedTest18;
  bool resourceZoomedTest20;
  bool resourceZoomedTest24;
  bool resourceCdAudio;
  bool resourceProofLanguage;
  bool resourceVideoLibras;
  bool resourceBrailleTest;
  bool resourceNone;
  int sendYear;
  String lastChange;
  int responsable;
  String responsableName;
  String responsableRg;
  String responsableCpf;
  int responsableScholarity;
  String responsableJob;
  bool bfParticipator;
  String foodRestrictions;
  String responsableTelephone;
  int hash;
  String filiation1Rg;
  String filiation1Cpf;
  int filiation1Scholarity;
  String filiation1Job;
  String filiation2Rg;
  String filiation2Cpf;
  int filiation2Scholarity;
  String filiation2Job;

  Student(
      {this.registerType,
      this.schoolInepIdFk,
      this.inepId,
      this.name,
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

  Student.fromJson(Map<String, dynamic> json) {
    registerType = json['register_type'];
    schoolInepIdFk = json['school_inep_id_fk'];
    inepId = json['inep_id'];
    name = json['name'];
    birthday = json['birthday'];
    sex = json['sex'];
    colorRace = json['color_race'];
    filiation = json['filiation'];
    filiation1 = json['filiation_1'];
    filiation2 = json['filiation_2'];
    nationality = json['nationality'];
    noDocumentDesc = json['no_document_desc'];
    scholarity = json['scholarity'];
    idEmail = json['id_email'];
    edcensoNationFk = json['edcenso_nation_fk'];
    edcensoUfFk = json['edcenso_uf_fk'];
    edcensoCityFk = json['edcenso_city_fk'];
    deficiency = json['deficiency'];
    deficiencyTypeBlindness = json['deficiency_type_blindness'];
    deficiencyTypeLowVision = json['deficiency_type_low_vision'];
    deficiencyTypeDeafness = json['deficiency_type_deafness'];
    deficiencyTypeDisabilityHearing =
        json['deficiency_type_disability_hearing'];
    deficiencyTypeDeafblindness = json['deficiency_type_deafblindness'];
    deficiencyTypePhisicalDisability =
        json['deficiency_type_phisical_disability'];
    deficiencyTypeIntelectualDisability =
        json['deficiency_type_intelectual_disability'];
    deficiencyTypeMultipleDisabilities =
        json['deficiency_type_multiple_disabilities'];
    deficiencyTypeAutism = json['deficiency_type_autism'];
    deficiencyTypeAspengerSyndrome = json['deficiency_type_aspenger_syndrome'];
    deficiencyTypeRettSyndrome = json['deficiency_type_rett_syndrome'];
    deficiencyTypeChildhoodDisintegrativeDisorder =
        json['deficiency_type_childhood_disintegrative_disorder'];
    deficiencyTypeGifted = json['deficiency_type_gifted'];
    resourceAidLector = json['resource_aid_lector'];
    resourceAidTranscription = json['resource_aid_transcription'];
    resourceInterpreterGuide = json['resource_interpreter_guide'];
    resourceInterpreterLibras = json['resource_interpreter_libras'];
    resourceLipReading = json['resource_lip_reading'];
    resourceZoomedTest16 = json['resource_zoomed_test_16'];
    resourceZoomedTest18 = json['resource_zoomed_test_18'];
    resourceZoomedTest20 = json['resource_zoomed_test_20'];
    resourceZoomedTest24 = json['resource_zoomed_test_24'];
    resourceCdAudio = json['resource_cd_audio'];
    resourceProofLanguage = json['resource_proof_language'];
    resourceVideoLibras = json['resource_video_libras'];
    resourceBrailleTest = json['resource_braille_test'];
    resourceNone = json['resource_none'];
    sendYear = json['send_year'];
    lastChange = json['last_change'];
    responsable = json['responsable'];
    responsableName = json['responsable_name'];
    responsableRg = json['responsable_rg'];
    responsableCpf = json['responsable_cpf'];
    responsableScholarity = json['responsable_scholarity'];
    responsableJob = json['responsable_job'];
    bfParticipator = json['bf_participator'];
    foodRestrictions = json['food_restrictions'];
    responsableTelephone = json['responsable_telephone'];
    hash = json['hash'];
    filiation1Rg = json['filiation_1_rg'];
    filiation1Cpf = json['filiation_1_cpf'];
    filiation1Scholarity = json['filiation_1_scholarity'];
    filiation1Job = json['filiation_1_job'];
    filiation2Rg = json['filiation_2_rg'];
    filiation2Cpf = json['filiation_2_cpf'];
    filiation2Scholarity = json['filiation_2_scholarity'];
    filiation2Job = json['filiation_2_job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['register_type'] = this.registerType;
    data['school_inep_id_fk'] = this.schoolInepIdFk;
    data['inep_id'] = this.inepId;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['sex'] = this.sex;
    data['color_race'] = this.colorRace;
    data['filiation'] = this.filiation;
    data['filiation_1'] = this.filiation1;
    data['filiation_2'] = this.filiation2;
    data['nationality'] = this.nationality;
    data['no_document_desc'] = this.noDocumentDesc;
    data['scholarity'] = this.scholarity;
    data['id_email'] = this.idEmail;
    data['edcenso_nation_fk'] = this.edcensoNationFk;
    data['edcenso_uf_fk'] = this.edcensoUfFk;
    data['edcenso_city_fk'] = this.edcensoCityFk;
    data['deficiency'] = this.deficiency;
    data['deficiency_type_blindness'] = this.deficiencyTypeBlindness;
    data['deficiency_type_low_vision'] = this.deficiencyTypeLowVision;
    data['deficiency_type_deafness'] = this.deficiencyTypeDeafness;
    data['deficiency_type_disability_hearing'] =
        this.deficiencyTypeDisabilityHearing;
    data['deficiency_type_deafblindness'] = this.deficiencyTypeDeafblindness;
    data['deficiency_type_phisical_disability'] =
        this.deficiencyTypePhisicalDisability;
    data['deficiency_type_intelectual_disability'] =
        this.deficiencyTypeIntelectualDisability;
    data['deficiency_type_multiple_disabilities'] =
        this.deficiencyTypeMultipleDisabilities;
    data['deficiency_type_autism'] = this.deficiencyTypeAutism;
    data['deficiency_type_aspenger_syndrome'] =
        this.deficiencyTypeAspengerSyndrome;
    data['deficiency_type_rett_syndrome'] = this.deficiencyTypeRettSyndrome;
    data['deficiency_type_childhood_disintegrative_disorder'] =
        this.deficiencyTypeChildhoodDisintegrativeDisorder;
    data['deficiency_type_gifted'] = this.deficiencyTypeGifted;
    data['resource_aid_lector'] = this.resourceAidLector;
    data['resource_aid_transcription'] = this.resourceAidTranscription;
    data['resource_interpreter_guide'] = this.resourceInterpreterGuide;
    data['resource_interpreter_libras'] = this.resourceInterpreterLibras;
    data['resource_lip_reading'] = this.resourceLipReading;
    data['resource_zoomed_test_16'] = this.resourceZoomedTest16;
    data['resource_zoomed_test_18'] = this.resourceZoomedTest18;
    data['resource_zoomed_test_20'] = this.resourceZoomedTest20;
    data['resource_zoomed_test_24'] = this.resourceZoomedTest24;
    data['resource_cd_audio'] = this.resourceCdAudio;
    data['resource_proof_language'] = this.resourceProofLanguage;
    data['resource_video_libras'] = this.resourceVideoLibras;
    data['resource_braille_test'] = this.resourceBrailleTest;
    data['resource_none'] = this.resourceNone;
    data['send_year'] = this.sendYear;
    data['last_change'] = this.lastChange;
    data['responsable'] = this.responsable;
    data['responsable_name'] = this.responsableName;
    data['responsable_rg'] = this.responsableRg;
    data['responsable_cpf'] = this.responsableCpf;
    data['responsable_scholarity'] = this.responsableScholarity;
    data['responsable_job'] = this.responsableJob;
    data['bf_participator'] = this.bfParticipator;
    data['food_restrictions'] = this.foodRestrictions;
    data['responsable_telephone'] = this.responsableTelephone;
    data['hash'] = this.hash;
    data['filiation_1_rg'] = this.filiation1Rg;
    data['filiation_1_cpf'] = this.filiation1Cpf;
    data['filiation_1_scholarity'] = this.filiation1Scholarity;
    data['filiation_1_job'] = this.filiation1Job;
    data['filiation_2_rg'] = this.filiation2Rg;
    data['filiation_2_cpf'] = this.filiation2Cpf;
    data['filiation_2_scholarity'] = this.filiation2Scholarity;
    data['filiation_2_job'] = this.filiation2Job;
    return data;
  }
}

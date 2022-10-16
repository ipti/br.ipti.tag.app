import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    super.id,
    super.name,
    super.registerType,
    super.schoolInepIdFk,
    super.inepId,
    super.birthday,
    super.sex,
    super.colorRace,
    super.filiation,
    super.filiation1,
    super.filiation2,
    super.nationality,
    super.noDocumentDesc,
    super.scholarity,
    super.idEmail,
    super.edcensoNationFk,
    super.edcensoUfFk,
    super.edcensoCityFk,
    super.deficiency,
    super.deficiencyTypeBlindness,
    super.deficiencyTypeLowVision,
    super.deficiencyTypeDeafness,
    super.deficiencyTypeDisabilityHearing,
    super.deficiencyTypeDeafblindness,
    super.deficiencyTypePhisicalDisability,
    super.deficiencyTypeIntelectualDisability,
    super.deficiencyTypeMultipleDisabilities,
    super.deficiencyTypeAutism,
    super.deficiencyTypeAspengerSyndrome,
    super.deficiencyTypeRettSyndrome,
    super.deficiencyTypeChildhoodDisintegrativeDisorder,
    super.deficiencyTypeGifted,
    super.resourceAidLector,
    super.resourceAidTranscription,
    super.resourceInterpreterGuide,
    super.resourceInterpreterLibras,
    super.resourceLipReading,
    super.resourceZoomedTest16,
    super.resourceZoomedTest18,
    super.resourceZoomedTest20,
    super.resourceZoomedTest24,
    super.resourceCdAudio,
    super.resourceProofLanguage,
    super.resourceVideoLibras,
    super.resourceBrailleTest,
    super.resourceNone,
    super.sendYear,
    super.lastChange,
    super.responsable,
    super.responsableName,
    super.responsableRg,
    super.responsableCpf,
    super.responsableScholarity,
    super.responsableJob,
    super.bfParticipator,
    super.foodRestrictions,
    super.responsableTelephone,
    super.hash,
    super.filiation1Rg,
    super.filiation1Cpf,
    super.filiation1Scholarity,
    super.filiation1Job,
    super.filiation2Rg,
    super.filiation2Cpf,
    super.filiation2Scholarity,
    super.filiation2Job,
  });
  // ignore: long-method
  factory StudentModel.fromEntity(Student student) {
    return StudentModel(
      id: student.id,
      name: student.name,
      registerType: student.registerType,
      schoolInepIdFk: student.schoolInepIdFk,
      inepId: student.inepId,
      birthday: student.birthday,
      sex: student.sex,
      colorRace: student.colorRace,
      filiation: student.filiation,
      filiation1: student.filiation1,
      filiation2: student.filiation2,
      nationality: student.nationality,
      noDocumentDesc: student.noDocumentDesc,
      scholarity: student.scholarity,
      idEmail: student.idEmail,
      edcensoNationFk: student.edcensoNationFk,
      edcensoUfFk: student.edcensoUfFk,
      edcensoCityFk: student.edcensoCityFk,
      deficiency: student.deficiency,
      deficiencyTypeBlindness: student.deficiencyTypeBlindness,
      deficiencyTypeLowVision: student.deficiencyTypeLowVision,
      deficiencyTypeDeafness: student.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing: student.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness: student.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability:
          student.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          student.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities:
          student.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: student.deficiencyTypeAutism,
      deficiencyTypeAspengerSyndrome: student.deficiencyTypeAspengerSyndrome,
      deficiencyTypeRettSyndrome: student.deficiencyTypeRettSyndrome,
      deficiencyTypeChildhoodDisintegrativeDisorder:
          student.deficiencyTypeChildhoodDisintegrativeDisorder,
      deficiencyTypeGifted: student.deficiencyTypeGifted,
      resourceAidLector: student.resourceAidLector,
      resourceAidTranscription: student.resourceAidTranscription,
      resourceInterpreterGuide: student.resourceInterpreterGuide,
      resourceInterpreterLibras: student.resourceInterpreterLibras,
      resourceLipReading: student.resourceLipReading,
      resourceZoomedTest16: student.resourceZoomedTest16,
      resourceZoomedTest18: student.resourceZoomedTest18,
      resourceZoomedTest20: student.resourceZoomedTest20,
      resourceZoomedTest24: student.resourceZoomedTest24,
      resourceCdAudio: student.resourceCdAudio,
      resourceProofLanguage: student.resourceProofLanguage,
      resourceVideoLibras: student.resourceVideoLibras,
      resourceBrailleTest: student.resourceBrailleTest,
      resourceNone: student.resourceNone,
      sendYear: student.sendYear,
      lastChange: student.lastChange,
      responsable: student.responsable,
      responsableName: student.responsableName,
      responsableRg: student.responsableRg,
      responsableCpf: student.responsableCpf,
      responsableScholarity: student.responsableScholarity,
      responsableJob: student.responsableJob,
      bfParticipator: student.bfParticipator,
      foodRestrictions: student.foodRestrictions,
      responsableTelephone: student.responsableTelephone,
      hash: student.hash,
      filiation1Rg: student.filiation1Rg,
      filiation1Cpf: student.filiation1Cpf,
      filiation1Scholarity: student.filiation1Scholarity,
      filiation1Job: student.filiation1Job,
      filiation2Rg: student.filiation2Rg,
      filiation2Cpf: student.filiation2Cpf,
      filiation2Scholarity: student.filiation2Scholarity,
      filiation2Job: student.filiation2Job,
    );
  }
  // ignore: long-method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'register_type': registerType,
      'school_inep_id_fk': schoolInepIdFk,
      'inep_id': inepId,
      'birthday': birthday,
      'sex': sex,
      'color_race': colorRace,
      'filiation': filiation,
      'filiation_1': filiation1,
      'filiation_2': filiation2,
      'nationality': nationality,
      'no_document_desc': noDocumentDesc,
      'scholarity': scholarity,
      'id_email': idEmail,
      'edcenso_nation_fk': edcensoNationFk,
      'edcenso_uf_fk': edcensoUfFk,
      'edcenso_city_fk': edcensoCityFk,
      'deficiency': deficiency,
      'deficiency_type_blindness': deficiencyTypeBlindness,
      'deficiency_type_low_vision': deficiencyTypeLowVision,
      'deficiency_type_deafness': deficiencyTypeDeafness,
      'deficiency_type_disability_hearing': deficiencyTypeDisabilityHearing,
      'deficiency_type_deafblindness': deficiencyTypeDeafblindness,
      'deficiency_type_phisical_disability': deficiencyTypePhisicalDisability,
      'deficiency_type_intelectual_disability':
          deficiencyTypeIntelectualDisability,
      'deficiency_type_multiple_disabilities':
          deficiencyTypeMultipleDisabilities,
      'deficiency_type_autism': deficiencyTypeAutism,
      'deficiency_type_aspenger_syndrome': deficiencyTypeAspengerSyndrome,
      'deficiency_type_rett_syndrome': deficiencyTypeRettSyndrome,
      'deficiency_type_childhood_disintegrative_disorder':
          deficiencyTypeChildhoodDisintegrativeDisorder,
      'deficiency_type_gifted': deficiencyTypeGifted,
      'resource_aid_lector': resourceAidLector,
      'resource_aid_transcription': resourceAidTranscription,
      'resource_interpreter_guide': resourceInterpreterGuide,
      'resource_interpreter_libras': resourceInterpreterLibras,
      'resource_lip_reading': resourceLipReading,
      'resource_zoomed_test16': resourceZoomedTest16,
      'resource_zoomed_test18': resourceZoomedTest18,
      'resource_zoomed_test20': resourceZoomedTest20,
      'resource_zoomed_test24': resourceZoomedTest24,
      'resource_cd_audio': resourceCdAudio,
      'resource_proof_language': resourceProofLanguage,
      'resource_video_libras': resourceVideoLibras,
      'resource_braille_test': resourceBrailleTest,
      'resource_none': resourceNone,
      'send_year': sendYear,
      'last_change': lastChange,
      'responsable': responsable,
      'responsable_name': responsableName,
      'responsable_rg': responsableRg,
      'responsable_cpf': responsableCpf,
      'responsable_scholarity': responsableScholarity,
      'responsable_job': responsableJob,
      'bf_participator': bfParticipator,
      'food_restrictions': foodRestrictions,
      'responsable_telephone': responsableTelephone,
      'hash': hash,
      'filiation1_rg': filiation1Rg,
      'filiation1_cpf': filiation1Cpf,
      'filiation1_scholarity': filiation1Scholarity,
      'filiation1_job': filiation1Job,
      'filiation_2_rg': filiation2Rg,
      'filiation_2_cpf': filiation2Cpf,
      'filiation_2_scholarity': filiation2Scholarity,
      'filiation_2_job': filiation2Job,
    };
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory StudentModel.fromJson(String source) => StudentModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return '''StudentModel(id: $id, name: $name, registerType: $registerType, schoolInepIdFk: $schoolInepIdFk, inepId: $inepId, birthday: $birthday, sex: $sex, colorRace: $colorRace, filiation: $filiation, filiation1: $filiation1, filiation2: $filiation2, nationality: $nationality, noDocumentDesc: $noDocumentDesc, scholarity: $scholarity, idEmail: $idEmail, edcensoNationFk: $edcensoNationFk, edcensoUfFk: $edcensoUfFk, edcensoCityFk: $edcensoCityFk, deficiency: $deficiency, deficiencyTypeBlindness: $deficiencyTypeBlindness, deficiencyTypeLowVision: $deficiencyTypeLowVision, deficiencyTypeDeafness: $deficiencyTypeDeafness, deficiencyTypeDisabilityHearing: $deficiencyTypeDisabilityHearing, deficiencyTypeDeafblindness: $deficiencyTypeDeafblindness, deficiencyTypePhisicalDisability: $deficiencyTypePhisicalDisability, deficiencyTypeIntelectualDisability: $deficiencyTypeIntelectualDisability, deficiencyTypeMultipleDisabilities: $deficiencyTypeMultipleDisabilities, deficiencyTypeAutism: $deficiencyTypeAutism, deficiencyTypeAspengerSyndrome: $deficiencyTypeAspengerSyndrome, deficiencyTypeRettSyndrome: $deficiencyTypeRettSyndrome, deficiencyTypeChildhoodDisintegrativeDisorder: $deficiencyTypeChildhoodDisintegrativeDisorder, deficiencyTypeGifted: $deficiencyTypeGifted, resourceAidLector: $resourceAidLector, resourceAidTranscription: $resourceAidTranscription, resourceInterpreterGuide: $resourceInterpreterGuide, resourceInterpreterLibras: $resourceInterpreterLibras, resourceLipReading: $resourceLipReading, resourceZoomedTest16: $resourceZoomedTest16, resourceZoomedTest18: $resourceZoomedTest18, resourceZoomedTest20: $resourceZoomedTest20, resourceZoomedTest24: $resourceZoomedTest24, resourceCdAudio: $resourceCdAudio, resourceProofLanguage: $resourceProofLanguage, resourceVideoLibras: $resourceVideoLibras, resourceBrailleTest: $resourceBrailleTest, resourceNone: $resourceNone, sendYear: $sendYear, lastChange: $lastChange, responsable: $responsable, responsableName: $responsableName, responsableRg: $responsableRg, responsableCpf: $responsableCpf, responsableScholarity: $responsableScholarity, responsableJob: $responsableJob, bfParticipator: $bfParticipator, foodRestrictions: $foodRestrictions, responsableTelephone: $responsableTelephone, hash: $hash, filiation1Rg: $filiation1Rg, filiation1Cpf: $filiation1Cpf, filiation1Scholarity: $filiation1Scholarity, filiation1Job: $filiation1Job, filiation2Rg: $filiation2Rg, filiation2Cpf: $filiation2Cpf, filiation2Scholarity: $filiation2Scholarity, filiation2Job: $filiation2Job)''';
  }

  @override
  // ignore: long-method
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentModel &&
        other.id == id &&
        other.name == name &&
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
  // ignore: long-method
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
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

  // ignore: long-method
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    var schoolInepFk = map['school_inep_id_fk'];

    if (schoolInepFk is Map) {
      schoolInepFk = schoolInepFk['_id'];
    }

    return StudentModel(
      id: map['id'],
      name: map['name'],
      registerType: map['register_type'],
      schoolInepIdFk: schoolInepFk as String?,
      inepId: map['inep_id'],
      birthday: map['birthday'],
      sex: map['sex'],
      colorRace: map['color_race'],
      filiation: map['filiation'],
      filiation1: map['filiation_1'],
      filiation2: map['filiation_2'],
      nationality: map['nationality'],
      noDocumentDesc: map['no_document_desc'],
      scholarity: map['scholarity'],
      idEmail: map['id_email'],
      edcensoNationFk: map['edcenso_nation_fk'],
      edcensoUfFk: map['edcenso_uf_fk'],
      edcensoCityFk: map['edcenso_city_fk'],
      deficiency: map['deficiency'],
      deficiencyTypeBlindness: map['deficiency_type_blindness'],
      deficiencyTypeLowVision: map['deficiency_type_low_vision'],
      deficiencyTypeDeafness: map['deficiency_type_deafness'],
      deficiencyTypeDisabilityHearing:
          map['deficiency_type_disability_hearing'],
      deficiencyTypeDeafblindness: map['deficiency_type_deafblindness'],
      deficiencyTypePhisicalDisability:
          map['deficiency_type_phisical_disability'],
      deficiencyTypeIntelectualDisability:
          map['deficiency_type_intelectual_disability'],
      deficiencyTypeMultipleDisabilities:
          map['deficiency_type_multiple_disabilities'],
      deficiencyTypeAutism: map['deficiency_type_autism'],
      deficiencyTypeAspengerSyndrome: map['deficiency_type_aspenger_syndrome'],
      deficiencyTypeRettSyndrome: map['deficiency_type_rett_syndrome'],
      deficiencyTypeChildhoodDisintegrativeDisorder:
          map['deficiency_type_childhood_disintegrative_disorder'],
      deficiencyTypeGifted: map['deficiency_type_gifted'],
      resourceAidLector: map['resource_aid_lector'],
      resourceAidTranscription: map['resource_aid_transcription'],
      resourceInterpreterGuide: map['resource_interpreter_guide'],
      resourceInterpreterLibras: map['resource_interpreter_libras'],
      resourceLipReading: map['resource_lip_reading'],
      resourceZoomedTest16: map['resource_zoomed_test16'],
      resourceZoomedTest18: map['resource_zoomed_test18'],
      resourceZoomedTest20: map['resource_zoomed_test20'],
      resourceZoomedTest24: map['resource_zoomed_test24'],
      resourceCdAudio: map['resource_cd_audio'],
      resourceProofLanguage: map['resource_proof_language'],
      resourceVideoLibras: map['resource_video_libras'],
      resourceBrailleTest: map['resource_braille_test'],
      resourceNone: map['resource_none'],
      sendYear: map['send_year'],
      lastChange: map['last_change'],
      responsable: map['responsable'],
      responsableName: map['responsable_name'],
      responsableRg: map['responsable_rg'],
      responsableCpf: map['responsable_cpf'],
      responsableScholarity: map['responsable_scholarity'],
      responsableJob: map['responsable_job'],
      bfParticipator: map['bf_participator'],
      foodRestrictions: map['food_restrictions'],
      responsableTelephone: map['responsable_telephone'],
      hash: map['hash'],
      filiation1Rg: map['filiation1_rg'],
      filiation1Cpf: map['filiation1_cpf'],
      filiation1Scholarity: map['filiation_1_scholarity'],
      filiation1Job: map['filiation1_job'],
      filiation2Rg: map['filiation_2_rg'],
      filiation2Cpf: map['filiation_2_cpf'],
      filiation2Scholarity: map['filiation_2_scholarity'],
      filiation2Job: map['filiation_2_job'],
    );
  }
}

import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';

class InstructorModel extends Instructor {
  InstructorModel({
    String? neighborhood,
    String? complement,
    String? addressNumber,
    String? address,
    String? cep,
    dynamic diffLocation,
    int? areaOfResidence,
    String? cpf,
    bool? otherCoursesNone = false,
    bool? otherCoursesOther = false,
    bool? otherCoursesEthnicEducation = false,
    bool? otherCoursesChildAndTeenageRights = false,
    bool? otherCoursesSexualEducation = false,
    bool? otherCoursesHumanRightsEducation = false,
    bool? otherCoursesEnvironmentEducation = false,
    bool? otherCoursesFieldEducation = false,
    bool? otherCoursesNativeEducation = false,
    bool? otherCoursesSpecialEducation = false,
    bool? otherCoursesEducationOfYouthAndAdults = false,
    bool? otherCoursesHighSchool = false,
    bool? otherCoursesBasicEducationFinalYears = false,
    bool? otherCoursesBasicEducationInitialYears = false,
    bool? otherCoursesPreSchool = false,
    bool? otherCoursesNursery = false,
    bool? postGraduationNone = false,
    bool? postGraduationDoctorate = false,
    bool? postGraduationMaster = false,
    bool? postGraduationSpecialization = false,
    bool? highEducationInstitutionCode3Fk = false,
    bool? highEducationFinalYear3 = false,
    bool? highEducationInitialYear3 = false,
    bool? highEducationCourseCode3Fk = false,
    bool? highEducationFormation3 = false,
    bool? highEducationSituation3 = false,
    bool? highEducationInstitutionCode2Fk = false,
    bool? highEducationFinalYear2 = false,
    bool? highEducationInitialYear2 = false,
    bool? highEducationCourseCode2Fk = false,
    bool? highEducationFormation2 = false,
    bool? highEducationSituation2 = false,
    bool? highEducationInstitutionCode1Fk = false,
    bool? highEducationFinalYear1 = false,
    bool? highEducationInitialYear1 = false,
    bool? highEducationCourseCode1Fk = false,
    bool? highEducationFormation1 = false,
    bool? highEducationSituation1 = false,
    dynamic hash,
    bool? deficiencyTypeGifted = false,
    bool? deficiencyTypeAutism = false,
    bool? deficiencyTypeMultipleDisabilities = false,
    bool? deficiencyTypeIntelectualDisability = false,
    bool? deficiencyTypePhisicalDisability = false,
    bool? deficiencyTypeDeafblindness = false,
    bool? deficiencyTypeDisabilityHearing = false,
    bool? deficiencyTypeDeafness = false,
    bool? deficiencyTypeLowVision = false,
    bool? deficiencyTypeBlindness = false,
    String? filiation2,
    String? filiation1,
    int? filiation,
    dynamic nis,
    String? email,
    dynamic inepId,
    String? registerType,
    String? id,
    String? schoolInepIdFk,
    String? name,
    String? birthdayDate,
    int? sex,
    int? colorRace,
    int? nationality,
    String? edcensoNationFk,
    String? edcensoUfFk,
    String? edcensoCityFk,
    bool? deficiency = false,
    int? scholarity,
    String? createdAt,
    String? updatedAt,
  }) : super(
          neighborhood: neighborhood,
          complement: complement,
          addressNumber: addressNumber,
          address: address,
          cep: cep,
          diffLocation: diffLocation,
          areaOfResidence: areaOfResidence,
          cpf: cpf,
          otherCoursesNone: otherCoursesNone ?? false,
          otherCoursesOther: otherCoursesOther ?? false,
          otherCoursesEthnicEducation: otherCoursesEthnicEducation ?? false,
          otherCoursesChildAndTeenageRights:
              otherCoursesChildAndTeenageRights ?? false,
          otherCoursesSexualEducation: otherCoursesSexualEducation ?? false,
          otherCoursesHumanRightsEducation:
              otherCoursesHumanRightsEducation ?? false,
          otherCoursesEnvironmentEducation:
              otherCoursesEnvironmentEducation ?? false,
          otherCoursesFieldEducation: otherCoursesFieldEducation ?? false,
          otherCoursesNativeEducation: otherCoursesNativeEducation ?? false,
          otherCoursesSpecialEducation: otherCoursesSpecialEducation ?? false,
          otherCoursesEducationOfYouthAndAdults:
              otherCoursesEducationOfYouthAndAdults ?? false,
          otherCoursesHighSchool: otherCoursesHighSchool ?? false,
          otherCoursesBasicEducationFinalYears:
              otherCoursesBasicEducationFinalYears ?? false,
          otherCoursesBasicEducationInitialYears:
              otherCoursesBasicEducationInitialYears ?? false,
          otherCoursesPreSchool: otherCoursesPreSchool ?? false,
          otherCoursesNursery: otherCoursesNursery ?? false,
          postGraduationNone: postGraduationNone ?? false,
          postGraduationDoctorate: postGraduationDoctorate ?? false,
          postGraduationMaster: postGraduationMaster ?? false,
          postGraduationSpecialization: postGraduationSpecialization ?? false,
          highEducationInstitutionCode3Fk:
              highEducationInstitutionCode3Fk ?? false,
          highEducationFinalYear3: highEducationFinalYear3 ?? false,
          highEducationInitialYear3: highEducationInitialYear3 ?? false,
          highEducationCourseCode3Fk: highEducationCourseCode3Fk ?? false,
          highEducationFormation3: highEducationFormation3 ?? false,
          highEducationSituation3: highEducationSituation3 ?? false,
          highEducationInstitutionCode2Fk:
              highEducationInstitutionCode2Fk ?? false,
          highEducationFinalYear2: highEducationFinalYear2 ?? false,
          highEducationInitialYear2: highEducationInitialYear2 ?? false,
          highEducationCourseCode2Fk: highEducationCourseCode2Fk ?? false,
          highEducationFormation2: highEducationFormation2 ?? false,
          highEducationSituation2: highEducationSituation2 ?? false,
          highEducationInstitutionCode1Fk:
              highEducationInstitutionCode1Fk ?? false,
          highEducationFinalYear1: highEducationFinalYear1 ?? false,
          highEducationInitialYear1: highEducationInitialYear1 ?? false,
          highEducationCourseCode1Fk: highEducationCourseCode1Fk ?? false,
          highEducationFormation1: highEducationFormation1 ?? false,
          highEducationSituation1: highEducationSituation1 ?? false,
          hash: hash,
          deficiencyTypeGifted: deficiencyTypeGifted ?? false,
          deficiencyTypeAutism: deficiencyTypeAutism ?? false,
          deficiencyTypeMultipleDisabilities:
              deficiencyTypeMultipleDisabilities ?? false,
          deficiencyTypeIntelectualDisability:
              deficiencyTypeIntelectualDisability ?? false,
          deficiencyTypePhisicalDisability:
              deficiencyTypePhisicalDisability ?? false,
          deficiencyTypeDeafblindness: deficiencyTypeDeafblindness ?? false,
          deficiencyTypeDisabilityHearing:
              deficiencyTypeDisabilityHearing ?? false,
          deficiencyTypeDeafness: deficiencyTypeDeafness ?? false,
          deficiencyTypeLowVision: deficiencyTypeLowVision ?? false,
          deficiencyTypeBlindness: deficiencyTypeBlindness ?? false,
          filiation2: filiation2,
          filiation1: filiation1,
          filiation: filiation,
          nis: nis,
          email: email,
          inepId: inepId,
          registerType: registerType,
          id: id,
          schoolInepIdFk: schoolInepIdFk,
          name: name,
          birthdayDate: birthdayDate,
          sex: sex,
          colorRace: colorRace,
          nationality: nationality,
          edcensoNationFk: edcensoNationFk,
          edcensoUfFk: edcensoUfFk,
          edcensoCityFk: edcensoCityFk,
          deficiency: deficiency ?? false,
          scholarity: scholarity,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
  Instructor copyWith({
    String? neighborhood,
    String? complement,
    String? addressNumber,
    String? address,
    String? cep,
    String? diffLocation,
    int? areaOfResidence,
    String? cpf,
    bool otherCoursesNone = false,
    bool otherCoursesOther = false,
    bool otherCoursesEthnicEducation = false,
    bool otherCoursesChildAndTeenageRights = false,
    bool otherCoursesSexualEducation = false,
    bool otherCoursesHumanRightsEducation = false,
    bool otherCoursesEnvironmentEducation = false,
    bool otherCoursesFieldEducation = false,
    bool otherCoursesNativeEducation = false,
    bool otherCoursesSpecialEducation = false,
    bool otherCoursesEducationOfYouthAndAdults = false,
    bool otherCoursesHighSchool = false,
    bool otherCoursesBasicEducationFinalYears = false,
    bool otherCoursesBasicEducationInitialYears = false,
    bool otherCoursesPreSchool = false,
    bool otherCoursesNursery = false,
    bool postGraduationNone = false,
    bool postGraduationDoctorate = false,
    bool postGraduationMaster = false,
    bool postGraduationSpecialization = false,
    bool highEducationInstitutionCode3Fk = false,
    bool highEducationFinalYear3 = false,
    bool highEducationInitialYear3 = false,
    bool highEducationCourseCode3Fk = false,
    bool highEducationFormation3 = false,
    bool highEducationSituation3 = false,
    bool highEducationInstitutionCode2Fk = false,
    bool highEducationFinalYear2 = false,
    bool highEducationInitialYear2 = false,
    bool highEducationCourseCode2Fk = false,
    bool highEducationFormation2 = false,
    bool highEducationSituation2 = false,
    bool highEducationInstitutionCode1Fk = false,
    bool highEducationFinalYear1 = false,
    bool highEducationInitialYear1 = false,
    bool highEducationCourseCode1Fk = false,
    bool highEducationFormation1 = false,
    bool highEducationSituation1 = false,
    String? hash,
    bool deficiencyTypeGifted = false,
    bool deficiencyTypeAutism = false,
    bool deficiencyTypeMultipleDisabilities = false,
    bool deficiencyTypeIntelectualDisability = false,
    bool deficiencyTypePhisicalDisability = false,
    bool deficiencyTypeDeafblindness = false,
    bool deficiencyTypeDisabilityHearing = false,
    bool deficiencyTypeDeafness = false,
    bool deficiencyTypeLowVision = false,
    bool deficiencyTypeBlindness = false,
    String? filiation2,
    String? filiation1,
    int? filiation,
    String? nis,
    String? email,
    String? inepId,
    String? registerType,
    String? id,
    String? schoolInepIdFk,
    String? name,
    String? birthdayDate,
    int? sex,
    int? colorRace,
    int? nationality,
    String? edcensoNationFk,
    String? edcensoUfFk,
    String? edcensoCityFk,
    bool deficiency = false,
    int? scholarity,
    String? createdAt,
    String? updatedAt,
  }) {
    return Instructor(
      neighborhood: neighborhood,
      complement: complement,
      addressNumber: addressNumber,
      address: address,
      cep: cep,
      diffLocation: diffLocation,
      areaOfResidence: areaOfResidence,
      cpf: cpf,
      otherCoursesNone: otherCoursesNone,
      otherCoursesOther: otherCoursesOther,
      otherCoursesEthnicEducation: otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights: otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation: otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation: otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation: otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation: otherCoursesFieldEducation,
      otherCoursesNativeEducation: otherCoursesNativeEducation,
      otherCoursesSpecialEducation: otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool: otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool: otherCoursesPreSchool,
      otherCoursesNursery: otherCoursesNursery,
      postGraduationNone: postGraduationNone,
      postGraduationDoctorate: postGraduationDoctorate,
      postGraduationMaster: postGraduationMaster,
      postGraduationSpecialization: postGraduationSpecialization,
      highEducationInstitutionCode3Fk: highEducationInstitutionCode3Fk,
      highEducationFinalYear3: highEducationFinalYear3,
      highEducationInitialYear3: highEducationInitialYear3,
      highEducationCourseCode3Fk: highEducationCourseCode3Fk,
      highEducationFormation3: highEducationFormation3,
      highEducationSituation3: highEducationSituation3,
      highEducationInstitutionCode2Fk: highEducationInstitutionCode2Fk,
      highEducationFinalYear2: highEducationFinalYear2,
      highEducationInitialYear2: highEducationInitialYear2,
      highEducationCourseCode2Fk: highEducationCourseCode2Fk,
      highEducationFormation2: highEducationFormation2,
      highEducationSituation2: highEducationSituation2,
      highEducationInstitutionCode1Fk: highEducationInstitutionCode1Fk,
      highEducationFinalYear1: highEducationFinalYear1,
      highEducationInitialYear1: highEducationInitialYear1,
      highEducationCourseCode1Fk: highEducationCourseCode1Fk,
      highEducationFormation1: highEducationFormation1,
      highEducationSituation1: highEducationSituation1,
      hash: hash,
      deficiencyTypeGifted: deficiencyTypeGifted,
      deficiencyTypeAutism: deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities: deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability: deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability: deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness: deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness: deficiencyTypeDeafness,
      deficiencyTypeLowVision: deficiencyTypeLowVision,
      deficiencyTypeBlindness: deficiencyTypeBlindness,
      filiation2: filiation2,
      filiation1: filiation1,
      filiation: filiation,
      nis: nis,
      email: email,
      inepId: inepId,
      registerType: registerType,
      id: id,
      schoolInepIdFk: schoolInepIdFk,
      name: name,
      birthdayDate: birthdayDate,
      sex: sex,
      colorRace: colorRace,
      nationality: nationality,
      edcensoNationFk: edcensoNationFk,
      edcensoUfFk: edcensoUfFk,
      edcensoCityFk: edcensoCityFk,
      deficiency: deficiency,
      scholarity: scholarity,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'neighborhood': neighborhood,
      'complement': complement,
      'address_number': addressNumber,
      'address': address,
      'cep': cep,
      'diff_location': diffLocation,
      'area_of_residence': areaOfResidence,
      'cpf': cpf,
      'other_courses_none': otherCoursesNone,
      'other_courses_other': otherCoursesOther,
      'other_courses_ethnic_education': otherCoursesEthnicEducation,
      'other_courses_child_and_teenage_rights':
          otherCoursesChildAndTeenageRights,
      'other_courses_sexual_education': otherCoursesSexualEducation,
      'other_courses_human_rights_education': otherCoursesHumanRightsEducation,
      'other_courses_environment_education': otherCoursesEnvironmentEducation,
      'other_courses_field_education': otherCoursesFieldEducation,
      'other_courses_native_education': otherCoursesNativeEducation,
      'other_courses_special_education': otherCoursesSpecialEducation,
      'other_courses_education_of_youth_and_adults':
          otherCoursesEducationOfYouthAndAdults,
      'other_courses_high_school': otherCoursesHighSchool,
      'other_courses_basic_education_final_years':
          otherCoursesBasicEducationFinalYears,
      'other_courses_basic_education_initial_years':
          otherCoursesBasicEducationInitialYears,
      'other_courses_pre_school': otherCoursesPreSchool,
      'other_courses_nursery': otherCoursesNursery,
      'post_graduation_none': postGraduationNone,
      'post_graduation_doctorate': postGraduationDoctorate,
      'post_graduation_master': postGraduationMaster,
      'post_graduation_specialization': postGraduationSpecialization,
      'high_education_institution_code3_fk': highEducationInstitutionCode3Fk,
      'high_education_final_year3': highEducationFinalYear3,
      'high_education_initial_year3': highEducationInitialYear3,
      'high_education_course_code3_fk': highEducationCourseCode3Fk,
      'high_education_formation3': highEducationFormation3,
      'high_education_situation3': highEducationSituation3,
      'high_education_institution_code2_fk': highEducationInstitutionCode2Fk,
      'high_education_final_year2': highEducationFinalYear2,
      'high_education_initial_year2': highEducationInitialYear2,
      'high_education_course_code2_fk': highEducationCourseCode2Fk,
      'high_education_formation2': highEducationFormation2,
      'high_education_situation2': highEducationSituation2,
      'high_education_institution_code1_fk': highEducationInstitutionCode1Fk,
      'high_education_final_year1': highEducationFinalYear1,
      'high_education_initial_year1': highEducationInitialYear1,
      'high_education_course_code1_fk': highEducationCourseCode1Fk,
      'high_education_formation1': highEducationFormation1,
      'high_education_situation1': highEducationSituation1,
      'hash': hash,
      'deficiency_type_gifted': deficiencyTypeGifted,
      'deficiency_type_autism': deficiencyTypeAutism,
      'deficiency_type_multiple_disabilities':
          deficiencyTypeMultipleDisabilities,
      'deficiency_type_intelectual_disability':
          deficiencyTypeIntelectualDisability,
      'deficiency_type_phisical_disability': deficiencyTypePhisicalDisability,
      'deficiency_type_deafblindness': deficiencyTypeDeafblindness,
      'deficiency_type_disability_hearing': deficiencyTypeDisabilityHearing,
      'deficiency_type_deafness': deficiencyTypeDeafness,
      'deficiency_type_low_vision': deficiencyTypeLowVision,
      'deficiency_type_blindness': deficiencyTypeBlindness,
      'filiation2': filiation2,
      'filiation1': filiation1,
      'filiation': filiation == 1,
      'nis': nis,
      'email': email,
      'inep_id': inepId,
      'register_type': registerType,
      'id': id,
      'school_inep_id_fk': schoolInepIdFk,
      'name': name,
      'birthday_date': birthdayDate,
      'sex': sex,
      'color_race': colorRace,
      'nationality': nationality,
      'edcenso_nation_fk': edcensoNationFk,
      'edcenso_uf_fk': edcensoUfFk,
      'edcenso_city_fk': edcensoCityFk,
      'deficiency': deficiency,
      'scholarity': scholarity,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
      neighborhood: map['neighborhood'],
      complement: map['complement'],
      addressNumber: map['address_number'],
      address: map['address'],
      cep: map['cep'],
      diffLocation: map['diff_location'],
      areaOfResidence: map['area_of_residence'],
      cpf: map['cpf'],
      otherCoursesNone: map['other_courses_none'],
      otherCoursesOther: map['other_courses_other'],
      otherCoursesEthnicEducation: map['other_courses_ethnic_education'],
      otherCoursesChildAndTeenageRights:
          map['other_courses_child_and_teenage_rights'],
      otherCoursesSexualEducation: map['other_courses_sexual_education'],
      otherCoursesHumanRightsEducation:
          map['other_courses_human_rights_education'],
      otherCoursesEnvironmentEducation:
          map['other_courses_environment_education'],
      otherCoursesFieldEducation: map['other_courses_field_education'],
      otherCoursesNativeEducation: map['other_courses_native_education'],
      otherCoursesSpecialEducation: map['other_courses_special_education'],
      otherCoursesEducationOfYouthAndAdults:
          map['other_courses_education_of_youth_and_adults'],
      otherCoursesHighSchool: map['other_courses_high_school'],
      otherCoursesBasicEducationFinalYears:
          map['other_courses_basic_education_final_years'],
      otherCoursesBasicEducationInitialYears:
          map['other_courses_basic_education_initial_years'],
      otherCoursesPreSchool: map['other_courses_pre_school'],
      otherCoursesNursery: map['other_courses_nursery'],
      postGraduationNone: map['post_graduation_none'],
      postGraduationDoctorate: map['post_graduation_doctorate'],
      postGraduationMaster: map['post_graduation_master'],
      postGraduationSpecialization: map['post_graduation_specialization'],
      highEducationInstitutionCode3Fk:
          map['high_education_institution_code3_fk'],
      highEducationFinalYear3: map['high_education_final_year3'],
      highEducationInitialYear3: map['high_education_initial_year3'],
      highEducationCourseCode3Fk: map['high_education_course_code3_fk'],
      highEducationFormation3: map['high_education_formation3'],
      highEducationSituation3: map['high_education_situation3'],
      highEducationInstitutionCode2Fk:
          map['high_education_institution_code2_fk'],
      highEducationFinalYear2: map['high_education_final_year2'],
      highEducationInitialYear2: map['high_education_initial_year2'],
      highEducationCourseCode2Fk: map['high_education_course_code2_fk'],
      highEducationFormation2: map['high_education_formation2'],
      highEducationSituation2: map['high_education_situation2'],
      highEducationInstitutionCode1Fk:
          map['high_education_institution_code1_fk'],
      highEducationFinalYear1: map['high_education_final_year1'],
      highEducationInitialYear1: map['high_education_initial_year1'],
      highEducationCourseCode1Fk: map['high_education_course_code1_fk'],
      highEducationFormation1: map['high_education_formation1'],
      highEducationSituation1: map['high_education_situation1'],
      hash: map['hash'],
      deficiencyTypeGifted: map['deficiency_type_gifted'],
      deficiencyTypeAutism: map['deficiency_type_autism'],
      deficiencyTypeMultipleDisabilities:
          map['deficiency_type_multiple_disabilities'],
      deficiencyTypeIntelectualDisability:
          map['deficiency_type_intelectual_disability'],
      deficiencyTypePhisicalDisability:
          map['deficiency_type_phisical_disability'],
      deficiencyTypeDeafblindness: map['deficiency_type_deafblindness'],
      deficiencyTypeDisabilityHearing:
          map['deficiency_type_disability_hearing'],
      deficiencyTypeDeafness: map['deficiency_type_deafness'],
      deficiencyTypeLowVision: map['deficiency_type_low_vision'],
      deficiencyTypeBlindness: map['deficiency_type_blindness'],
      filiation2: map['filiation2'],
      filiation1: map['filiation1'],
      filiation: map['filiation'] ? 1 : 2,
      nis: map['nis'],
      email: map['email'],
      inepId: map['inep_id'],
      registerType: map['register_type'],
      id: map['id'],
      schoolInepIdFk: map['school_inep_id_fk'],
      name: map['name'],
      birthdayDate: map['birthday_date'],
      sex: map['sex'],
      colorRace: map['color_race'],
      nationality: map['nationality'],
      edcensoNationFk: map['edcenso_nation_fk'],
      edcensoUfFk: map['edcenso_uf_fk'],
      edcensoCityFk: map['edcenso_city_fk'],
      deficiency: map['deficiency'],
      scholarity: map['scholarity'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstructorModel.fromJson(String source) =>
      InstructorModel.fromMap(json.decode(source));

  factory InstructorModel.fromEntity(Instructor entity) {
    return InstructorModel(
      neighborhood: entity.neighborhood,
      complement: entity.complement,
      addressNumber: entity.addressNumber,
      address: entity.address,
      cep: entity.cep,
      diffLocation: entity.diffLocation,
      areaOfResidence: entity.areaOfResidence,
      cpf: entity.cpf,
      otherCoursesNone: entity.otherCoursesNone,
      otherCoursesOther: entity.otherCoursesOther,
      otherCoursesEthnicEducation: entity.otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights:
          entity.otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation: entity.otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation: entity.otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation: entity.otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation: entity.otherCoursesFieldEducation,
      otherCoursesNativeEducation: entity.otherCoursesNativeEducation,
      otherCoursesSpecialEducation: entity.otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          entity.otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool: entity.otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          entity.otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          entity.otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool: entity.otherCoursesPreSchool,
      otherCoursesNursery: entity.otherCoursesNursery,
      postGraduationNone: entity.postGraduationNone,
      postGraduationDoctorate: entity.postGraduationDoctorate,
      postGraduationMaster: entity.postGraduationMaster,
      postGraduationSpecialization: entity.postGraduationSpecialization,
      highEducationInstitutionCode3Fk: entity.highEducationInstitutionCode3Fk,
      highEducationFinalYear3: entity.highEducationFinalYear3,
      highEducationInitialYear3: entity.highEducationInitialYear3,
      highEducationCourseCode3Fk: entity.highEducationCourseCode3Fk,
      highEducationFormation3: entity.highEducationFormation3,
      highEducationSituation3: entity.highEducationSituation3,
      highEducationInstitutionCode2Fk: entity.highEducationInstitutionCode2Fk,
      highEducationFinalYear2: entity.highEducationFinalYear2,
      highEducationInitialYear2: entity.highEducationInitialYear2,
      highEducationCourseCode2Fk: entity.highEducationCourseCode2Fk,
      highEducationFormation2: entity.highEducationFormation2,
      highEducationSituation2: entity.highEducationSituation2,
      highEducationInstitutionCode1Fk: entity.highEducationInstitutionCode1Fk,
      highEducationFinalYear1: entity.highEducationFinalYear1,
      highEducationInitialYear1: entity.highEducationInitialYear1,
      highEducationCourseCode1Fk: entity.highEducationCourseCode1Fk,
      highEducationFormation1: entity.highEducationFormation1,
      highEducationSituation1: entity.highEducationSituation1,
      hash: entity.hash,
      deficiencyTypeGifted: entity.deficiencyTypeGifted,
      deficiencyTypeAutism: entity.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities:
          entity.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          entity.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability: entity.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness: entity.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: entity.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness: entity.deficiencyTypeDeafness,
      deficiencyTypeLowVision: entity.deficiencyTypeLowVision,
      deficiencyTypeBlindness: entity.deficiencyTypeBlindness,
      filiation2: entity.filiation2,
      filiation1: entity.filiation1,
      filiation: entity.filiation,
      nis: entity.nis,
      email: entity.email,
      inepId: entity.inepId,
      registerType: entity.registerType,
      id: entity.id,
      schoolInepIdFk: entity.schoolInepIdFk,
      name: entity.name,
      birthdayDate: entity.birthdayDate,
      sex: entity.sex,
      colorRace: entity.colorRace,
      nationality: entity.nationality,
      edcensoNationFk: entity.edcensoNationFk,
      edcensoUfFk: entity.edcensoUfFk,
      edcensoCityFk: entity.edcensoCityFk,
      deficiency: entity.deficiency,
      scholarity: entity.scholarity,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Instructor(neighborhood: $neighborhood, complement: $complement, addressNumber: $addressNumber, address: $address, cep: $cep, diffLocation: $diffLocation, areaOfResidence: $areaOfResidence, cpf: $cpf, otherCoursesNone: $otherCoursesNone, otherCoursesOther: $otherCoursesOther, otherCoursesEthnicEducation: $otherCoursesEthnicEducation, otherCoursesChildAndTeenageRights: $otherCoursesChildAndTeenageRights, otherCoursesSexualEducation: $otherCoursesSexualEducation, otherCoursesHumanRightsEducation: $otherCoursesHumanRightsEducation, otherCoursesEnvironmentEducation: $otherCoursesEnvironmentEducation, otherCoursesFieldEducation: $otherCoursesFieldEducation, otherCoursesNativeEducation: $otherCoursesNativeEducation, otherCoursesSpecialEducation: $otherCoursesSpecialEducation, otherCoursesEducationOfYouthAndAdults: $otherCoursesEducationOfYouthAndAdults, otherCoursesHighSchool: $otherCoursesHighSchool, otherCoursesBasicEducationFinalYears: $otherCoursesBasicEducationFinalYears, otherCoursesBasicEducationInitialYears: $otherCoursesBasicEducationInitialYears, otherCoursesPreSchool: $otherCoursesPreSchool, otherCoursesNursery: $otherCoursesNursery, postGraduationNone: $postGraduationNone, postGraduationDoctorate: $postGraduationDoctorate, postGraduationMaster: $postGraduationMaster, postGraduationSpecialization: $postGraduationSpecialization, highEducationInstitutionCode3Fk: $highEducationInstitutionCode3Fk, highEducationFinalYear3: $highEducationFinalYear3, highEducationInitialYear3: $highEducationInitialYear3, highEducationCourseCode3Fk: $highEducationCourseCode3Fk, highEducationFormation3: $highEducationFormation3, highEducationSituation3: $highEducationSituation3, highEducationInstitutionCode2Fk: $highEducationInstitutionCode2Fk, highEducationFinalYear2: $highEducationFinalYear2, highEducationInitialYear2: $highEducationInitialYear2, highEducationCourseCode2Fk: $highEducationCourseCode2Fk, highEducationFormation2: $highEducationFormation2, highEducationSituation2: $highEducationSituation2, highEducationInstitutionCode1Fk: $highEducationInstitutionCode1Fk, highEducationFinalYear1: $highEducationFinalYear1, highEducationInitialYear1: $highEducationInitialYear1, highEducationCourseCode1Fk: $highEducationCourseCode1Fk, highEducationFormation1: $highEducationFormation1, highEducationSituation1: $highEducationSituation1, hash: $hash, deficiencyTypeGifted: $deficiencyTypeGifted, deficiencyTypeAutism: $deficiencyTypeAutism, deficiencyTypeMultipleDisabilities: $deficiencyTypeMultipleDisabilities, deficiencyTypeIntelectualDisability: $deficiencyTypeIntelectualDisability, deficiencyTypePhisicalDisability: $deficiencyTypePhisicalDisability, deficiencyTypeDeafblindness: $deficiencyTypeDeafblindness, deficiencyTypeDisabilityHearing: $deficiencyTypeDisabilityHearing, deficiencyTypeDeafness: $deficiencyTypeDeafness, deficiencyTypeLowVision: $deficiencyTypeLowVision, deficiencyTypeBlindness: $deficiencyTypeBlindness, filiation2: $filiation2, filiation1: $filiation1, filiation: $filiation, nis: $nis, email: $email, inepId: $inepId, registerType: $registerType, id: $id, schoolInepIdFk: $schoolInepIdFk, name: $name, birthdayDate: $birthdayDate, sex: $sex, colorRace: $colorRace, nationality: $nationality, edcensoNationFk: $edcensoNationFk, edcensoUfFk: $edcensoUfFk, edcensoCityFk: $edcensoCityFk, deficiency: $deficiency, scholarity: $scholarity, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  int get hashCode {
    return neighborhood.hashCode ^
        complement.hashCode ^
        addressNumber.hashCode ^
        address.hashCode ^
        cep.hashCode ^
        diffLocation.hashCode ^
        areaOfResidence.hashCode ^
        cpf.hashCode ^
        otherCoursesNone.hashCode ^
        otherCoursesOther.hashCode ^
        otherCoursesEthnicEducation.hashCode ^
        otherCoursesChildAndTeenageRights.hashCode ^
        otherCoursesSexualEducation.hashCode ^
        otherCoursesHumanRightsEducation.hashCode ^
        otherCoursesEnvironmentEducation.hashCode ^
        otherCoursesFieldEducation.hashCode ^
        otherCoursesNativeEducation.hashCode ^
        otherCoursesSpecialEducation.hashCode ^
        otherCoursesEducationOfYouthAndAdults.hashCode ^
        otherCoursesHighSchool.hashCode ^
        otherCoursesBasicEducationFinalYears.hashCode ^
        otherCoursesBasicEducationInitialYears.hashCode ^
        otherCoursesPreSchool.hashCode ^
        otherCoursesNursery.hashCode ^
        postGraduationNone.hashCode ^
        postGraduationDoctorate.hashCode ^
        postGraduationMaster.hashCode ^
        postGraduationSpecialization.hashCode ^
        highEducationInstitutionCode3Fk.hashCode ^
        highEducationFinalYear3.hashCode ^
        highEducationInitialYear3.hashCode ^
        highEducationCourseCode3Fk.hashCode ^
        highEducationFormation3.hashCode ^
        highEducationSituation3.hashCode ^
        highEducationInstitutionCode2Fk.hashCode ^
        highEducationFinalYear2.hashCode ^
        highEducationInitialYear2.hashCode ^
        highEducationCourseCode2Fk.hashCode ^
        highEducationFormation2.hashCode ^
        highEducationSituation2.hashCode ^
        highEducationInstitutionCode1Fk.hashCode ^
        highEducationFinalYear1.hashCode ^
        highEducationInitialYear1.hashCode ^
        highEducationCourseCode1Fk.hashCode ^
        highEducationFormation1.hashCode ^
        highEducationSituation1.hashCode ^
        hash.hashCode ^
        deficiencyTypeGifted.hashCode ^
        deficiencyTypeAutism.hashCode ^
        deficiencyTypeMultipleDisabilities.hashCode ^
        deficiencyTypeIntelectualDisability.hashCode ^
        deficiencyTypePhisicalDisability.hashCode ^
        deficiencyTypeDeafblindness.hashCode ^
        deficiencyTypeDisabilityHearing.hashCode ^
        deficiencyTypeDeafness.hashCode ^
        deficiencyTypeLowVision.hashCode ^
        deficiencyTypeBlindness.hashCode ^
        filiation2.hashCode ^
        filiation1.hashCode ^
        filiation.hashCode ^
        nis.hashCode ^
        email.hashCode ^
        inepId.hashCode ^
        registerType.hashCode ^
        id.hashCode ^
        schoolInepIdFk.hashCode ^
        name.hashCode ^
        birthdayDate.hashCode ^
        sex.hashCode ^
        colorRace.hashCode ^
        nationality.hashCode ^
        edcensoNationFk.hashCode ^
        edcensoUfFk.hashCode ^
        edcensoCityFk.hashCode ^
        deficiency.hashCode ^
        scholarity.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Instructor &&
        other.neighborhood == neighborhood &&
        other.complement == complement &&
        other.addressNumber == addressNumber &&
        other.address == address &&
        other.cep == cep &&
        other.diffLocation == diffLocation &&
        other.areaOfResidence == areaOfResidence &&
        other.cpf == cpf &&
        other.otherCoursesNone == otherCoursesNone &&
        other.otherCoursesOther == otherCoursesOther &&
        other.otherCoursesEthnicEducation == otherCoursesEthnicEducation &&
        other.otherCoursesChildAndTeenageRights ==
            otherCoursesChildAndTeenageRights &&
        other.otherCoursesSexualEducation == otherCoursesSexualEducation &&
        other.otherCoursesHumanRightsEducation ==
            otherCoursesHumanRightsEducation &&
        other.otherCoursesEnvironmentEducation ==
            otherCoursesEnvironmentEducation &&
        other.otherCoursesFieldEducation == otherCoursesFieldEducation &&
        other.otherCoursesNativeEducation == otherCoursesNativeEducation &&
        other.otherCoursesSpecialEducation == otherCoursesSpecialEducation &&
        other.otherCoursesEducationOfYouthAndAdults ==
            otherCoursesEducationOfYouthAndAdults &&
        other.otherCoursesHighSchool == otherCoursesHighSchool &&
        other.otherCoursesBasicEducationFinalYears ==
            otherCoursesBasicEducationFinalYears &&
        other.otherCoursesBasicEducationInitialYears ==
            otherCoursesBasicEducationInitialYears &&
        other.otherCoursesPreSchool == otherCoursesPreSchool &&
        other.otherCoursesNursery == otherCoursesNursery &&
        other.postGraduationNone == postGraduationNone &&
        other.postGraduationDoctorate == postGraduationDoctorate &&
        other.postGraduationMaster == postGraduationMaster &&
        other.postGraduationSpecialization == postGraduationSpecialization &&
        other.highEducationInstitutionCode3Fk ==
            highEducationInstitutionCode3Fk &&
        other.highEducationFinalYear3 == highEducationFinalYear3 &&
        other.highEducationInitialYear3 == highEducationInitialYear3 &&
        other.highEducationCourseCode3Fk == highEducationCourseCode3Fk &&
        other.highEducationFormation3 == highEducationFormation3 &&
        other.highEducationSituation3 == highEducationSituation3 &&
        other.highEducationInstitutionCode2Fk ==
            highEducationInstitutionCode2Fk &&
        other.highEducationFinalYear2 == highEducationFinalYear2 &&
        other.highEducationInitialYear2 == highEducationInitialYear2 &&
        other.highEducationCourseCode2Fk == highEducationCourseCode2Fk &&
        other.highEducationFormation2 == highEducationFormation2 &&
        other.highEducationSituation2 == highEducationSituation2 &&
        other.highEducationInstitutionCode1Fk ==
            highEducationInstitutionCode1Fk &&
        other.highEducationFinalYear1 == highEducationFinalYear1 &&
        other.highEducationInitialYear1 == highEducationInitialYear1 &&
        other.highEducationCourseCode1Fk == highEducationCourseCode1Fk &&
        other.highEducationFormation1 == highEducationFormation1 &&
        other.highEducationSituation1 == highEducationSituation1 &&
        other.hash == hash &&
        other.deficiencyTypeGifted == deficiencyTypeGifted &&
        other.deficiencyTypeAutism == deficiencyTypeAutism &&
        other.deficiencyTypeMultipleDisabilities ==
            deficiencyTypeMultipleDisabilities &&
        other.deficiencyTypeIntelectualDisability ==
            deficiencyTypeIntelectualDisability &&
        other.deficiencyTypePhisicalDisability ==
            deficiencyTypePhisicalDisability &&
        other.deficiencyTypeDeafblindness == deficiencyTypeDeafblindness &&
        other.deficiencyTypeDisabilityHearing ==
            deficiencyTypeDisabilityHearing &&
        other.deficiencyTypeDeafness == deficiencyTypeDeafness &&
        other.deficiencyTypeLowVision == deficiencyTypeLowVision &&
        other.deficiencyTypeBlindness == deficiencyTypeBlindness &&
        other.filiation2 == filiation2 &&
        other.filiation1 == filiation1 &&
        other.filiation == filiation &&
        other.nis == nis &&
        other.email == email &&
        other.inepId == inepId &&
        other.registerType == registerType &&
        other.id == id &&
        other.schoolInepIdFk == schoolInepIdFk &&
        other.name == name &&
        other.birthdayDate == birthdayDate &&
        other.sex == sex &&
        other.colorRace == colorRace &&
        other.nationality == nationality &&
        other.edcensoNationFk == edcensoNationFk &&
        other.edcensoUfFk == edcensoUfFk &&
        other.edcensoCityFk == edcensoCityFk &&
        other.deficiency == deficiency &&
        other.scholarity == scholarity &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }
}

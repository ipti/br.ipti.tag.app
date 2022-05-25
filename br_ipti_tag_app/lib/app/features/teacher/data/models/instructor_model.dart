import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';

class InstructorModel extends Instructor {
  InstructorModel({
    bool? otherCoursesNone,
    bool? otherCoursesOther,
    bool? otherCoursesEthnicEducation,
    bool? otherCoursesChildAndTeenageRights,
    bool? otherCoursesSexualEducation,
    bool? otherCoursesHumanRightsEducation,
    bool? otherCoursesEnvironmentEducation,
    bool? otherCoursesFieldEducation,
    bool? otherCoursesNativeEducation,
    bool? otherCoursesSpecialEducation,
    bool? otherCoursesEducationOfYouthAndAdults,
    bool? otherCoursesHighSchool,
    bool? otherCoursesBasicEducationFinalYears,
    bool? otherCoursesBasicEducationInitialYears,
    bool? otherCoursesPreSchool,
    bool? otherCoursesNursery,
    bool? postGraduationNone,
    bool? postGraduationDoctorate,
    bool? postGraduationMaster,
    bool? postGraduationSpecialization,
    bool? highEducationInstitutionCode3Fk,
    bool? highEducationFinalYear3,
    bool? highEducationInitialYear3,
    bool? highEducationCourseCode3Fk,
    bool? highEducationFormation3,
    bool? highEducationSituation3,
    bool? highEducationInstitutionCode2Fk,
    bool? highEducationFinalYear2,
    bool? highEducationInitialYear2,
    bool? highEducationCourseCode2Fk,
    bool? highEducationFormation2,
    bool? highEducationSituation2,
    bool? highEducationInstitutionCode1Fk,
    bool? highEducationFinalYear1,
    bool? highEducationInitialYear1,
    bool? highEducationCourseCode1Fk,
    bool? highEducationFormation1,
    bool? highEducationSituation1,
    String? hash,
    bool? deficiencyTypeGifted,
    bool? deficiencyTypeAutism,
    bool? deficiencyTypeMultipleDisabilities,
    bool? deficiencyTypeIntelectualDisability,
    bool? deficiencyTypePhisicalDisability,
    bool? deficiencyTypeDeafblindness,
    bool? deficiencyTypeDisabilityHearing,
    bool? deficiencyTypeDeafness,
    bool? deficiencyTypeLowVision,
    bool? deficiencyTypeBlindness,
    String? filiation2,
    String? filiation1,
    bool? filiation,
    String? nis,
    String? email,
    String? inepId,
    String? registerType,
    String? sId,
    String? schoolInepIdFk,
    String? name,
    String? birthdayDate,
    int? sex,
    int? colorRace,
    int? nationality,
    String? edcensoNationFk,
    String? edcensoUfFk,
    String? edcensoCityFk,
    bool? deficiency,
    int? scholarity,
  }) : super(
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
          deficiencyTypeMultipleDisabilities:
              deficiencyTypeMultipleDisabilities,
          deficiencyTypeIntelectualDisability:
              deficiencyTypeIntelectualDisability,
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
          sId: sId,
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
        );

  InstructorModel copyWith({
    bool? otherCoursesNone,
    bool? otherCoursesOther,
    bool? otherCoursesEthnicEducation,
    bool? otherCoursesChildAndTeenageRights,
    bool? otherCoursesSexualEducation,
    bool? otherCoursesHumanRightsEducation,
    bool? otherCoursesEnvironmentEducation,
    bool? otherCoursesFieldEducation,
    bool? otherCoursesNativeEducation,
    bool? otherCoursesSpecialEducation,
    bool? otherCoursesEducationOfYouthAndAdults,
    bool? otherCoursesHighSchool,
    bool? otherCoursesBasicEducationFinalYears,
    bool? otherCoursesBasicEducationInitialYears,
    bool? otherCoursesPreSchool,
    bool? otherCoursesNursery,
    bool? postGraduationNone,
    bool? postGraduationDoctorate,
    bool? postGraduationMaster,
    bool? postGraduationSpecialization,
    bool? highEducationInstitutionCode3Fk,
    bool? highEducationFinalYear3,
    bool? highEducationInitialYear3,
    bool? highEducationCourseCode3Fk,
    bool? highEducationFormation3,
    bool? highEducationSituation3,
    bool? highEducationInstitutionCode2Fk,
    bool? highEducationFinalYear2,
    bool? highEducationInitialYear2,
    bool? highEducationCourseCode2Fk,
    bool? highEducationFormation2,
    bool? highEducationSituation2,
    bool? highEducationInstitutionCode1Fk,
    bool? highEducationFinalYear1,
    bool? highEducationInitialYear1,
    bool? highEducationCourseCode1Fk,
    bool? highEducationFormation1,
    bool? highEducationSituation1,
    String? hash,
    bool? deficiencyTypeGifted,
    bool? deficiencyTypeAutism,
    bool? deficiencyTypeMultipleDisabilities,
    bool? deficiencyTypeIntelectualDisability,
    bool? deficiencyTypePhisicalDisability,
    bool? deficiencyTypeDeafblindness,
    bool? deficiencyTypeDisabilityHearing,
    bool? deficiencyTypeDeafness,
    bool? deficiencyTypeLowVision,
    bool? deficiencyTypeBlindness,
    String? filiation2,
    String? filiation1,
    bool? filiation,
    String? nis,
    String? email,
    String? inepId,
    String? registerType,
    String? sId,
    String? schoolInepIdFk,
    String? name,
    String? birthdayDate,
    int? sex,
    int? colorRace,
    int? nationality,
    String? edcensoNationFk,
    String? edcensoUfFk,
    String? edcensoCityFk,
    bool? deficiency,
    int? scholarity,
  }) {
    return InstructorModel(
      otherCoursesNone: otherCoursesNone ?? this.otherCoursesNone,
      otherCoursesOther: otherCoursesOther ?? this.otherCoursesOther,
      otherCoursesEthnicEducation:
          otherCoursesEthnicEducation ?? this.otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights: otherCoursesChildAndTeenageRights ??
          this.otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation:
          otherCoursesSexualEducation ?? this.otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation: otherCoursesHumanRightsEducation ??
          this.otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation: otherCoursesEnvironmentEducation ??
          this.otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation:
          otherCoursesFieldEducation ?? this.otherCoursesFieldEducation,
      otherCoursesNativeEducation:
          otherCoursesNativeEducation ?? this.otherCoursesNativeEducation,
      otherCoursesSpecialEducation:
          otherCoursesSpecialEducation ?? this.otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          otherCoursesEducationOfYouthAndAdults ??
              this.otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool:
          otherCoursesHighSchool ?? this.otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          otherCoursesBasicEducationFinalYears ??
              this.otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          otherCoursesBasicEducationInitialYears ??
              this.otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool:
          otherCoursesPreSchool ?? this.otherCoursesPreSchool,
      otherCoursesNursery: otherCoursesNursery ?? this.otherCoursesNursery,
      postGraduationNone: postGraduationNone ?? this.postGraduationNone,
      postGraduationDoctorate:
          postGraduationDoctorate ?? this.postGraduationDoctorate,
      postGraduationMaster: postGraduationMaster ?? this.postGraduationMaster,
      postGraduationSpecialization:
          postGraduationSpecialization ?? this.postGraduationSpecialization,
      highEducationInstitutionCode3Fk: highEducationInstitutionCode3Fk ??
          this.highEducationInstitutionCode3Fk,
      highEducationFinalYear3:
          highEducationFinalYear3 ?? this.highEducationFinalYear3,
      highEducationInitialYear3:
          highEducationInitialYear3 ?? this.highEducationInitialYear3,
      highEducationCourseCode3Fk:
          highEducationCourseCode3Fk ?? this.highEducationCourseCode3Fk,
      highEducationFormation3:
          highEducationFormation3 ?? this.highEducationFormation3,
      highEducationSituation3:
          highEducationSituation3 ?? this.highEducationSituation3,
      highEducationInstitutionCode2Fk: highEducationInstitutionCode2Fk ??
          this.highEducationInstitutionCode2Fk,
      highEducationFinalYear2:
          highEducationFinalYear2 ?? this.highEducationFinalYear2,
      highEducationInitialYear2:
          highEducationInitialYear2 ?? this.highEducationInitialYear2,
      highEducationCourseCode2Fk:
          highEducationCourseCode2Fk ?? this.highEducationCourseCode2Fk,
      highEducationFormation2:
          highEducationFormation2 ?? this.highEducationFormation2,
      highEducationSituation2:
          highEducationSituation2 ?? this.highEducationSituation2,
      highEducationInstitutionCode1Fk: highEducationInstitutionCode1Fk ??
          this.highEducationInstitutionCode1Fk,
      highEducationFinalYear1:
          highEducationFinalYear1 ?? this.highEducationFinalYear1,
      highEducationInitialYear1:
          highEducationInitialYear1 ?? this.highEducationInitialYear1,
      highEducationCourseCode1Fk:
          highEducationCourseCode1Fk ?? this.highEducationCourseCode1Fk,
      highEducationFormation1:
          highEducationFormation1 ?? this.highEducationFormation1,
      highEducationSituation1:
          highEducationSituation1 ?? this.highEducationSituation1,
      hash: hash ?? this.hash,
      deficiencyTypeGifted: deficiencyTypeGifted ?? this.deficiencyTypeGifted,
      deficiencyTypeAutism: deficiencyTypeAutism ?? this.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities: deficiencyTypeMultipleDisabilities ??
          this.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          deficiencyTypeIntelectualDisability ??
              this.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability: deficiencyTypePhisicalDisability ??
          this.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness:
          deficiencyTypeDeafblindness ?? this.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: deficiencyTypeDisabilityHearing ??
          this.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness:
          deficiencyTypeDeafness ?? this.deficiencyTypeDeafness,
      deficiencyTypeLowVision:
          deficiencyTypeLowVision ?? this.deficiencyTypeLowVision,
      deficiencyTypeBlindness:
          deficiencyTypeBlindness ?? this.deficiencyTypeBlindness,
      filiation2: filiation2 ?? this.filiation2,
      filiation1: filiation1 ?? this.filiation1,
      filiation: filiation ?? this.filiation,
      nis: nis ?? this.nis,
      email: email ?? this.email,
      inepId: inepId ?? this.inepId,
      registerType: registerType ?? this.registerType,
      sId: sId ?? this.sId,
      schoolInepIdFk: schoolInepIdFk ?? this.schoolInepIdFk,
      name: name ?? this.name,
      birthdayDate: birthdayDate ?? this.birthdayDate,
      sex: sex ?? this.sex,
      colorRace: colorRace ?? this.colorRace,
      nationality: nationality ?? this.nationality,
      edcensoNationFk: edcensoNationFk ?? this.edcensoNationFk,
      edcensoUfFk: edcensoUfFk ?? this.edcensoUfFk,
      edcensoCityFk: edcensoCityFk ?? this.edcensoCityFk,
      deficiency: deficiency ?? this.deficiency,
      scholarity: scholarity ?? this.scholarity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
      'filiation': filiation,
      'nis': nis,
      'email': email,
      'inep_id': inepId,
      'register_type': registerType,
      's_id': sId,
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
    };
  }

  factory InstructorModel.fromEntity(Instructor instructor) {
    return InstructorModel(
      otherCoursesNone: instructor.otherCoursesNone,
      otherCoursesOther: instructor.otherCoursesOther,
      otherCoursesEthnicEducation: instructor.otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights:
          instructor.otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation: instructor.otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation:
          instructor.otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation:
          instructor.otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation: instructor.otherCoursesFieldEducation,
      otherCoursesNativeEducation: instructor.otherCoursesNativeEducation,
      otherCoursesSpecialEducation: instructor.otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          instructor.otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool: instructor.otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          instructor.otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          instructor.otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool: instructor.otherCoursesPreSchool,
      otherCoursesNursery: instructor.otherCoursesNursery,
      postGraduationNone: instructor.postGraduationNone,
      postGraduationDoctorate: instructor.postGraduationDoctorate,
      postGraduationMaster: instructor.postGraduationMaster,
      postGraduationSpecialization: instructor.postGraduationSpecialization,
      highEducationInstitutionCode3Fk:
          instructor.highEducationInstitutionCode3Fk,
      highEducationFinalYear3: instructor.highEducationFinalYear3,
      highEducationInitialYear3: instructor.highEducationInitialYear3,
      highEducationCourseCode3Fk: instructor.highEducationCourseCode3Fk,
      highEducationFormation3: instructor.highEducationFormation3,
      highEducationSituation3: instructor.highEducationSituation3,
      highEducationInstitutionCode2Fk:
          instructor.highEducationInstitutionCode2Fk,
      highEducationFinalYear2: instructor.highEducationFinalYear2,
      highEducationInitialYear2: instructor.highEducationInitialYear2,
      highEducationCourseCode2Fk: instructor.highEducationCourseCode2Fk,
      highEducationFormation2: instructor.highEducationFormation2,
      highEducationSituation2: instructor.highEducationSituation2,
      highEducationInstitutionCode1Fk:
          instructor.highEducationInstitutionCode1Fk,
      highEducationFinalYear1: instructor.highEducationFinalYear1,
      highEducationInitialYear1: instructor.highEducationInitialYear1,
      highEducationCourseCode1Fk: instructor.highEducationCourseCode1Fk,
      highEducationFormation1: instructor.highEducationFormation1,
      highEducationSituation1: instructor.highEducationSituation1,
      hash: instructor.hash,
      deficiencyTypeGifted: instructor.deficiencyTypeGifted,
      deficiencyTypeAutism: instructor.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities:
          instructor.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          instructor.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability:
          instructor.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness: instructor.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing:
          instructor.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness: instructor.deficiencyTypeDeafness,
      deficiencyTypeLowVision: instructor.deficiencyTypeLowVision,
      deficiencyTypeBlindness: instructor.deficiencyTypeBlindness,
      filiation2: instructor.filiation2,
      filiation1: instructor.filiation1,
      filiation: instructor.filiation,
      nis: instructor.nis,
      email: instructor.email,
      inepId: instructor.inepId,
      registerType: instructor.registerType,
      sId: instructor.sId,
      schoolInepIdFk: instructor.schoolInepIdFk,
      name: instructor.name,
      birthdayDate: instructor.birthdayDate,
      sex: instructor.sex,
      colorRace: instructor.colorRace,
      nationality: instructor.nationality,
      edcensoNationFk: instructor.edcensoNationFk,
      edcensoUfFk: instructor.edcensoUfFk,
      edcensoCityFk: instructor.edcensoCityFk,
      deficiency: instructor.deficiency,
      scholarity: instructor.scholarity,
    );
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
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
      filiation: map['filiation'],
      nis: map['nis'],
      email: map['email'],
      inepId: map['inep_id'],
      registerType: map['register_type'],
      sId: map['s_id'],
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
    );
  }

  String toJson() => json.encode(toMap());

  factory InstructorModel.fromJson(String source) =>
      InstructorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''InstructorModel(otherCoursesNone: $otherCoursesNone, otherCoursesOther: $otherCoursesOther, otherCoursesEthnicEducation: $otherCoursesEthnicEducation, otherCoursesChildAndTeenageRights: $otherCoursesChildAndTeenageRights, otherCoursesSexualEducation: $otherCoursesSexualEducation, otherCoursesHumanRightsEducation: $otherCoursesHumanRightsEducation, otherCoursesEnvironmentEducation: $otherCoursesEnvironmentEducation, otherCoursesFieldEducation: $otherCoursesFieldEducation, otherCoursesNativeEducation: $otherCoursesNativeEducation, otherCoursesSpecialEducation: $otherCoursesSpecialEducation, otherCoursesEducationOfYouthAndAdults: $otherCoursesEducationOfYouthAndAdults, otherCoursesHighSchool: $otherCoursesHighSchool, otherCoursesBasicEducationFinalYears: $otherCoursesBasicEducationFinalYears, otherCoursesBasicEducationInitialYears: $otherCoursesBasicEducationInitialYears, otherCoursesPreSchool: $otherCoursesPreSchool, otherCoursesNursery: $otherCoursesNursery, postGraduationNone: $postGraduationNone, postGraduationDoctorate: $postGraduationDoctorate, postGraduationMaster: $postGraduationMaster, postGraduationSpecialization: $postGraduationSpecialization, highEducationInstitutionCode3Fk: $highEducationInstitutionCode3Fk, highEducationFinalYear3: $highEducationFinalYear3, highEducationInitialYear3: $highEducationInitialYear3, highEducationCourseCode3Fk: $highEducationCourseCode3Fk, highEducationFormation3: $highEducationFormation3, highEducationSituation3: $highEducationSituation3, highEducationInstitutionCode2Fk: $highEducationInstitutionCode2Fk, highEducationFinalYear2: $highEducationFinalYear2, highEducationInitialYear2: $highEducationInitialYear2, highEducationCourseCode2Fk: $highEducationCourseCode2Fk, highEducationFormation2: $highEducationFormation2, highEducationSituation2: $highEducationSituation2, highEducationInstitutionCode1Fk: $highEducationInstitutionCode1Fk, highEducationFinalYear1: $highEducationFinalYear1, highEducationInitialYear1: $highEducationInitialYear1, highEducationCourseCode1Fk: $highEducationCourseCode1Fk, highEducationFormation1: $highEducationFormation1, highEducationSituation1: $highEducationSituation1, hash: $hash, deficiencyTypeGifted: $deficiencyTypeGifted, deficiencyTypeAutism: $deficiencyTypeAutism, deficiencyTypeMultipleDisabilities: $deficiencyTypeMultipleDisabilities, deficiencyTypeIntelectualDisability: $deficiencyTypeIntelectualDisability, deficiencyTypePhisicalDisability: $deficiencyTypePhisicalDisability, deficiencyTypeDeafblindness: $deficiencyTypeDeafblindness, deficiencyTypeDisabilityHearing: $deficiencyTypeDisabilityHearing, deficiencyTypeDeafness: $deficiencyTypeDeafness, deficiencyTypeLowVision: $deficiencyTypeLowVision, deficiencyTypeBlindness: $deficiencyTypeBlindness, filiation2: $filiation2, filiation1: $filiation1, filiation: $filiation, nis: $nis, email: $email, inepId: $inepId, registerType: $registerType, sId: $sId, schoolInepIdFk: $schoolInepIdFk, name: $name, birthdayDate: $birthdayDate, sex: $sex, colorRace: $colorRace, nationality: $nationality, edcensoNationFk: $edcensoNationFk, edcensoUfFk: $edcensoUfFk, edcensoCityFk: $edcensoCityFk, deficiency: $deficiency, scholarity: $scholarity)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InstructorModel &&
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
        other.sId == sId &&
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
        other.scholarity == scholarity;
  }

  @override
  int get hashCode {
    return otherCoursesNone.hashCode ^
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
        sId.hashCode ^
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
        scholarity.hashCode;
  }
}

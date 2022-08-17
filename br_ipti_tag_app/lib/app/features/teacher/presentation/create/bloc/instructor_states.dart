import 'package:equatable/equatable.dart';

enum InstructorFormStatus { Loaded, Empty, Loading, Error, Success }

class InstructorFormState extends Equatable {
  final InstructorFormStatus status;
  final int tabIndex;
  final bool isValidPersonal;
  final bool isValidFormAddress;
  final bool isValidFormEducation;
  final String? neighborhood;
  final String? complement;
  final String? addressNumber;
  final String? address;
  final String? cep;
  final String? diffLocation;
  final int? areaOfResidence;
  final String? cpf;
  final bool otherCoursesNone;
  final bool otherCoursesOther;
  final bool otherCoursesEthnicEducation;
  final bool otherCoursesChildAndTeenageRights;
  final bool otherCoursesSexualEducation;
  final bool otherCoursesHumanRightsEducation;
  final bool otherCoursesEnvironmentEducation;
  final bool otherCoursesFieldEducation;
  final bool otherCoursesNativeEducation;
  final bool otherCoursesSpecialEducation;
  final bool otherCoursesEducationOfYouthAndAdults;
  final bool otherCoursesHighSchool;
  final bool otherCoursesBasicEducationFinalYears;
  final bool otherCoursesBasicEducationInitialYears;
  final bool otherCoursesPreSchool;
  final bool otherCoursesNursery;
  final bool postGraduationNone;
  final bool postGraduationDoctorate;
  final bool postGraduationMaster;
  final bool postGraduationSpecialization;
  final bool highEducationInstitutionCode3Fk;
  final bool highEducationFinalYear3;
  final bool highEducationInitialYear3;
  final bool highEducationCourseCode3Fk;
  final bool highEducationFormation3;
  final bool highEducationSituation3;
  final bool highEducationInstitutionCode2Fk;
  final bool highEducationFinalYear2;
  final bool highEducationInitialYear2;
  final bool highEducationCourseCode2Fk;
  final bool highEducationFormation2;
  final bool highEducationSituation2;
  final bool highEducationInstitutionCode1Fk;
  final bool highEducationFinalYear1;
  final bool highEducationInitialYear1;
  final bool highEducationCourseCode1Fk;
  final bool highEducationFormation1;
  final bool highEducationSituation1;
  final String? hash;
  final bool deficiencyTypeGifted;
  final bool deficiencyTypeAutism;
  final bool deficiencyTypeMultipleDisabilities;
  final bool deficiencyTypeIntelectualDisability;
  final bool deficiencyTypePhisicalDisability;
  final bool deficiencyTypeDeafblindness;
  final bool deficiencyTypeDisabilityHearing;
  final bool deficiencyTypeDeafness;
  final bool deficiencyTypeLowVision;
  final bool deficiencyTypeBlindness;
  final String? filiation2;
  final String? filiation1;
  final int? filiation;
  final String? nis;
  final String? email;
  final String? inepId;
  final String? registerType;
  final String? id;
  final String? schoolInepIdFk;
  final String? name;
  final String? birthdayDate;
  final int? sex;
  final int? colorRace;
  final int? nationality;
  final String? edcensoNationFk;
  final String? edcensoUfFk;
  final String? edcensoCityFk;
  final bool deficiency;
  final int? scholarity;
  const InstructorFormState({
    this.status = InstructorFormStatus.Empty,
    this.isValidPersonal = false,
    this.isValidFormAddress = false,
    this.isValidFormEducation = false,
    this.tabIndex = 0,
    this.neighborhood,
    this.complement,
    this.addressNumber,
    this.address,
    this.cep,
    this.diffLocation,
    this.areaOfResidence,
    this.cpf,
    this.otherCoursesNone = false,
    this.otherCoursesOther = false,
    this.otherCoursesEthnicEducation = false,
    this.otherCoursesChildAndTeenageRights = false,
    this.otherCoursesSexualEducation = false,
    this.otherCoursesHumanRightsEducation = false,
    this.otherCoursesEnvironmentEducation = false,
    this.otherCoursesFieldEducation = true,
    this.otherCoursesNativeEducation = false,
    this.otherCoursesSpecialEducation = false,
    this.otherCoursesEducationOfYouthAndAdults = false,
    this.otherCoursesHighSchool = false,
    this.otherCoursesBasicEducationFinalYears = false,
    this.otherCoursesBasicEducationInitialYears = false,
    this.otherCoursesPreSchool = false,
    this.otherCoursesNursery = false,
    this.postGraduationNone = false,
    this.postGraduationDoctorate = false,
    this.postGraduationMaster = false,
    this.postGraduationSpecialization = false,
    this.highEducationInstitutionCode3Fk = false,
    this.highEducationFinalYear3 = false,
    this.highEducationInitialYear3 = false,
    this.highEducationCourseCode3Fk = false,
    this.highEducationFormation3 = false,
    this.highEducationSituation3 = false,
    this.highEducationInstitutionCode2Fk = false,
    this.highEducationFinalYear2 = false,
    this.highEducationInitialYear2 = false,
    this.highEducationCourseCode2Fk = false,
    this.highEducationFormation2 = false,
    this.highEducationSituation2 = false,
    this.highEducationInstitutionCode1Fk = false,
    this.highEducationFinalYear1 = false,
    this.highEducationInitialYear1 = false,
    this.highEducationCourseCode1Fk = false,
    this.highEducationFormation1 = false,
    this.highEducationSituation1 = false,
    this.hash,
    this.deficiencyTypeGifted = false,
    this.deficiencyTypeAutism = false,
    this.deficiencyTypeMultipleDisabilities = false,
    this.deficiencyTypeIntelectualDisability = false,
    this.deficiencyTypePhisicalDisability = false,
    this.deficiencyTypeDeafblindness = false,
    this.deficiencyTypeDisabilityHearing = false,
    this.deficiencyTypeDeafness = false,
    this.deficiencyTypeLowVision = false,
    this.deficiencyTypeBlindness = false,
    this.filiation2,
    this.filiation1,
    this.filiation,
    this.nis,
    this.email,
    this.inepId,
    this.registerType,
    this.id,
    this.schoolInepIdFk,
    this.name,
    this.birthdayDate,
    this.sex,
    this.colorRace,
    this.nationality,
    this.edcensoNationFk,
    this.edcensoUfFk,
    this.edcensoCityFk,
    this.deficiency = false,
    this.scholarity,
  });

  @override
  List<Object> get props {
    return [
      status,
      isValidPersonal,
      isValidFormAddress,
      isValidFormEducation,
      tabIndex,
      neighborhood ?? "",
      complement ?? "",
      addressNumber ?? "",
      address ?? "",
      cep ?? "",
      diffLocation ?? "",
      areaOfResidence ?? "",
      cpf ?? "",
      otherCoursesNone,
      otherCoursesOther,
      otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation,
      otherCoursesNativeEducation,
      otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool,
      otherCoursesNursery,
      postGraduationNone,
      postGraduationDoctorate,
      postGraduationMaster,
      postGraduationSpecialization,
      highEducationInstitutionCode3Fk,
      highEducationFinalYear3,
      highEducationInitialYear3,
      highEducationCourseCode3Fk,
      highEducationFormation3,
      highEducationSituation3,
      highEducationInstitutionCode2Fk,
      highEducationFinalYear2,
      highEducationInitialYear2,
      highEducationCourseCode2Fk,
      highEducationFormation2,
      highEducationSituation2,
      highEducationInstitutionCode1Fk,
      highEducationFinalYear1,
      highEducationInitialYear1,
      highEducationCourseCode1Fk,
      highEducationFormation1,
      highEducationSituation1,
      hash ?? "",
      deficiencyTypeGifted,
      deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness,
      deficiencyTypeLowVision,
      deficiencyTypeBlindness,
      filiation2 ?? "",
      filiation1 ?? "",
      filiation ?? "",
      nis ?? "",
      email ?? "",
      inepId ?? "",
      registerType ?? "",
      id ?? "",
      schoolInepIdFk ?? "",
      name ?? "",
      birthdayDate ?? "",
      sex ?? "",
      colorRace ?? "",
      nationality ?? "",
      edcensoNationFk ?? "",
      edcensoUfFk ?? "",
      edcensoCityFk ?? "",
      deficiency,
      scholarity ?? "",
    ];
  }

  InstructorFormState copyWith({
    InstructorFormStatus? status,
    bool? isValidPersonal,
    bool? isValidFormAddress,
    bool? isValidFormEducation,
    int? tabIndex,
    String? neighborhood,
    String? complement,
    String? addressNumber,
    String? address,
    String? cep,
    String? diffLocation,
    int? areaOfResidence,
    String? cpf,
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
    bool? deficiency,
    int? scholarity,
  }) {
    return InstructorFormState(
      status: status ?? this.status,
      isValidPersonal: isValidPersonal ?? this.isValidPersonal,
      isValidFormAddress: isValidFormAddress ?? this.isValidFormAddress,
      isValidFormEducation: isValidFormEducation ?? this.isValidFormEducation,
      tabIndex: tabIndex ?? this.tabIndex,
      neighborhood: neighborhood ?? this.neighborhood,
      complement: complement ?? this.complement,
      addressNumber: addressNumber ?? this.addressNumber,
      address: address ?? this.address,
      cep: cep ?? this.cep,
      diffLocation: diffLocation ?? this.diffLocation,
      areaOfResidence: areaOfResidence ?? this.areaOfResidence,
      cpf: cpf ?? this.cpf,
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
      id: id ?? this.id,
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
}

class EmptyInstructorState extends InstructorFormState {
  const EmptyInstructorState() : super(status: InstructorFormStatus.Empty);
  @override
  List<Object> get props => [];
}

class CreateInstructorErrorState extends InstructorFormState {
  final String message;
  const CreateInstructorErrorState({
    required this.message,
  }) : super(status: InstructorFormStatus.Error);

  @override
  List<Object> get props => [message];
}

class CreateInstructorSuccessState extends InstructorFormState {
  final String message;
  const CreateInstructorSuccessState({
    required this.message,
  }) : super(status: InstructorFormStatus.Error);

  @override
  List<Object> get props => [message];
}

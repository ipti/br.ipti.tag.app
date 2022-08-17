import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/instructor_repository.dart';

import 'package:dartz/dartz.dart';

class UpdateInstructorsUsecase
    implements Usecase<Instructor, UpdateInstructorParams> {
  UpdateInstructorsUsecase(this._repositoryInstructor);

  final InstructorRepository _repositoryInstructor;

  @override
  Future<Either<Exception, Instructor>> call(
    UpdateInstructorParams params,
  ) async {
    final instructor = Instructor(
      schoolInepIdFk: params.schoolInepIdFk,
      cpf: params.cpf,
      deficiencyTypeGifted: params.deficiencyTypeGifted,
      deficiencyTypeAutism: params.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities:
          params.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          params.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability: params.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness: params.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: params.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness: params.deficiencyTypeDeafness,
      deficiencyTypeLowVision: params.deficiencyTypeLowVision,
      deficiencyTypeBlindness: params.deficiencyTypeBlindness,
      filiation2: params.filiation2,
      filiation1: params.filiation1,
      filiation: params.filiation,
      nis: params.nis,
      email: params.email,
      registerType: params.registerType,
      name: params.name,
      birthdayDate: params.birthdayDate,
      sex: params.sex,
      colorRace: params.colorRace,
      nationality: params.nationality,
      edcensoNationFk: params.edcensoNationFk,
      edcensoUfFk: params.edcensoUfFk,
      edcensoCityFk: params.edcensoCityFk,
      deficiency: params.deficiency,
      scholarity: params.scholarity,

      // address
      neighborhood: params.neighborhood,
      complement: params.complement,
      addressNumber: params.addressNumber,
      address: params.address,
      cep: params.cep,
      areaOfResidence: params.areaOfResidence,

      // education
      otherCoursesNone: params.otherCoursesNone,
      otherCoursesOther: params.otherCoursesOther,
      otherCoursesEthnicEducation: params.otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights:
          params.otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation: params.otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation: params.otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation: params.otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation: params.otherCoursesFieldEducation,
      otherCoursesNativeEducation: params.otherCoursesNativeEducation,
      otherCoursesSpecialEducation: params.otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          params.otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool: params.otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          params.otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          params.otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool: params.otherCoursesPreSchool,
      otherCoursesNursery: params.otherCoursesNursery,
      postGraduationNone: params.postGraduationNone,
      postGraduationDoctorate: params.postGraduationDoctorate,
      postGraduationMaster: params.postGraduationMaster,
      postGraduationSpecialization: params.postGraduationSpecialization,
    );

    final result = await _repositoryInstructor.update(params.id, instructor);
    return result;
  }
}

class UpdateInstructorParams {
  String id;
  String? neighborhood;
  String? complement;
  String? addressNumber;
  String? address;
  String? cep;
  String? diffLocation;
  int? areaOfResidence;
  String? cpf;
  bool otherCoursesNone = false;
  bool otherCoursesOther = false;
  bool otherCoursesEthnicEducation = false;
  bool otherCoursesChildAndTeenageRights = false;
  bool otherCoursesSexualEducation = false;
  bool otherCoursesHumanRightsEducation = false;
  bool otherCoursesEnvironmentEducation = false;
  bool otherCoursesFieldEducation = false;
  bool otherCoursesNativeEducation = false;
  bool otherCoursesSpecialEducation = false;
  bool otherCoursesEducationOfYouthAndAdults = false;
  bool otherCoursesHighSchool = false;
  bool otherCoursesBasicEducationFinalYears = false;
  bool otherCoursesBasicEducationInitialYears = false;
  bool otherCoursesPreSchool = false;
  bool otherCoursesNursery = false;
  bool postGraduationNone = false;
  bool postGraduationDoctorate = false;
  bool postGraduationMaster = false;
  bool postGraduationSpecialization = false;
  bool highEducationInstitutionCode3Fk = false;
  bool highEducationFinalYear3 = false;
  bool highEducationInitialYear3 = false;
  bool highEducationCourseCode3Fk = false;
  bool highEducationFormation3 = false;
  bool highEducationSituation3 = false;
  bool highEducationInstitutionCode2Fk = false;
  bool highEducationFinalYear2 = false;
  bool highEducationInitialYear2 = false;
  bool highEducationCourseCode2Fk = false;
  bool highEducationFormation2 = false;
  bool highEducationSituation2 = false;
  bool highEducationInstitutionCode1Fk = false;
  bool highEducationFinalYear1 = false;
  bool highEducationInitialYear1 = false;
  bool highEducationCourseCode1Fk = false;
  bool highEducationFormation1 = false;
  bool highEducationSituation1 = false;
  String? hash;
  bool deficiencyTypeGifted = false;
  bool deficiencyTypeAutism = false;
  bool deficiencyTypeMultipleDisabilities = false;
  bool deficiencyTypeIntelectualDisability = false;
  bool deficiencyTypePhisicalDisability = false;
  bool deficiencyTypeDeafblindness = false;
  bool deficiencyTypeDisabilityHearing = false;
  bool deficiencyTypeDeafness = false;
  bool deficiencyTypeLowVision = false;
  bool deficiencyTypeBlindness = false;
  String? filiation2;
  String? filiation1;
  int? filiation;
  String? nis;
  String? email;
  String? inepId;
  String registerType;
  String schoolInepIdFk;
  String name;
  String birthdayDate;
  int sex;
  int colorRace;
  int nationality;
  String edcensoNationFk;
  String edcensoUfFk;
  String edcensoCityFk;
  bool deficiency = false;
  int scholarity;

  UpdateInstructorParams({
    required this.id,
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
    this.otherCoursesFieldEducation = false,
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
    required this.registerType,
    required this.schoolInepIdFk,
    required this.name,
    required this.birthdayDate,
    required this.sex,
    required this.colorRace,
    required this.nationality,
    required this.edcensoNationFk,
    required this.edcensoUfFk,
    required this.edcensoCityFk,
    this.deficiency = false,
    required this.scholarity,
  });
}

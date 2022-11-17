import 'package:br_ipti_tag_app/app/core/util/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../pages/address/bloc/instructor_address_states.dart';
import '../pages/education/bloc/instructor_education_states.dart';
import '../pages/personal/bloc/instructor_personal_states.dart';
import 'instructor_states.dart';

class CreateInstructorBloc extends Cubit<InstructorFormState> {
  CreateInstructorBloc(
    this._createInstructorsUsecase,
    this._updateInstructorsUsecase,
    this._getInstructorsUsecase,
  ) : super(
          const EmptyInstructorState(),
        );

  final CreateInstructorsUsecase _createInstructorsUsecase;
  final UpdateInstructorsUsecase _updateInstructorsUsecase;
  final GetInstructorsUsecase _getInstructorsUsecase;

  final _session = Modular.get<SessionBloc>();

  void goToTab(int index) {
    emit(
      state.copyWith(tabIndex: index),
    );
  }

  void notifyError(String message) {
    final cacheState = state.copyWith();
    emit(
      CreateInstructorErrorState(message: message),
    );
    emit(cacheState);
  }

  void notifySuccess(String message) {
    final cacheState = state.copyWith();
    emit(
      CreateInstructorSuccessState(message: message),
    );
    emit(cacheState);
  }

  void loadInstructorData({required Instructor instructor}) {
    final loadState = InstructorFormState(
      status: InstructorFormStatus.Loaded,
      isValidPersonal: true,
      id: instructor.id,
      cpf: instructor.cpf,
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
      registerType: instructor.registerType,
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
      isValidFormAddress: true,
      neighborhood: instructor.neighborhood,
      complement: instructor.complement,
      addressNumber: instructor.addressNumber,
      address: instructor.address,
      cep: instructor.cep,
      areaOfResidence: instructor.areaOfResidence,
      isValidFormEducation: true,
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
    );
    emit(loadState);
  }

  void loadPersonalData({required InstructorPersonalState personal}) {
    final loadPersonalDataState = state.copyWith(
      isValidPersonal: true,
      cpf: personal.cpf,
      deficiencyTypeGifted: personal.deficiencyTypeGifted,
      deficiencyTypeAutism: personal.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities:
          personal.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          personal.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability:
          personal.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness: personal.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: personal.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness: personal.deficiencyTypeDeafness,
      deficiencyTypeLowVision: personal.deficiencyTypeLowVision,
      deficiencyTypeBlindness: personal.deficiencyTypeBlindness,
      filiation2: personal.filiation2,
      filiation1: personal.filiation1,
      filiation: personal.filiation,
      nis: personal.nis,
      email: personal.email,
      registerType: personal.registerType,
      name: personal.name,
      birthdayDate: personal.birthdayDate,
      sex: personal.sex,
      colorRace: personal.colorRace,
      nationality: personal.nationality,
      edcensoNationFk: personal.edcensoNationFk,
      edcensoUfFk: personal.edcensoUfFk,
      edcensoCityFk: personal.edcensoCityFk,
      deficiency: personal.deficiency,
      scholarity: personal.scholarity,
    );

    emit(loadPersonalDataState);
  }

  void loadAddressData({required InstructorAddressState address}) {
    final loadAddressDataState = state.copyWith(
      isValidFormAddress: true,
      neighborhood: address.neighborhood,
      complement: address.complement,
      addressNumber: address.number,
      address: address.address,
      cep: address.cep,
      areaOfResidence: address.residenceZone,
      edcensoCityFk: address.edcensoCityFk,
      edcensoUfFk: address.edcensoUfFk,
    );

    emit(loadAddressDataState);
  }

  void loadEducationData({required InstructorEducationState education}) {
    final loadedEducationDataState = state.copyWith(
      isValidFormEducation: true,
      otherCoursesNone: education.otherCoursesNone,
      otherCoursesOther: education.otherCoursesOther,
      otherCoursesEthnicEducation: education.otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights:
          education.otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation: education.otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation:
          education.otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation:
          education.otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation: education.otherCoursesFieldEducation,
      otherCoursesNativeEducation: education.otherCoursesNativeEducation,
      otherCoursesSpecialEducation: education.otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          education.otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool: education.otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          education.otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          education.otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool: education.otherCoursesPreSchool,
      otherCoursesNursery: education.otherCoursesNursery,
      postGraduationNone: education.postGraduationNone,
      postGraduationDoctorate: education.postGraduationDoctorate,
      postGraduationMaster: education.postGraduationMaster,
      postGraduationSpecialization: education.postGraduationSpecialization,
    );

    emit(loadedEducationDataState);
  }

  Future fetch(int objectId) async {
    final param = GetInstructorParams(objectId);
    final result = await _getInstructorsUsecase(param);
    result.fold(
      (error) => notifyError(
        error.toString(),
      ),
      (instructor) => loadInstructorData(instructor: instructor),
    );
  }

  Future create() async {
    if (!(state.isValidFormAddress &&
        state.isValidPersonal &&
        state.isValidFormEducation)) {
      notifyError(
        "Verifique se todos os campos obrigatórios foram preenchidos",
      );

      return;
    }
    await _session.fetchCurrentSchool();
    final school = _session.state.currentSchool!;

    final params = CreateInstructorParams(
      schoolInepIdFk: school.inepId,
      cpf: state.cpf,
      deficiencyTypeGifted: state.deficiencyTypeGifted,
      deficiencyTypeAutism: state.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities:
          state.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          state.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability: state.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness: state.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: state.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness: state.deficiencyTypeDeafness,
      deficiencyTypeLowVision: state.deficiencyTypeLowVision,
      deficiencyTypeBlindness: state.deficiencyTypeBlindness,
      filiation2: state.filiation2,
      filiation1: state.filiation1,
      filiation: state.filiation,
      nis: state.nis,
      email: state.email,
      registerType: 'rg',
      name: state.name!,
      birthdayDate: state.birthdayDate!,
      sex: state.sex!,
      colorRace: state.colorRace!,
      nationality: state.nationality!,
      edcensoNationFk: 76,
      edcensoUfFk: state.edcensoUfFk!,
      edcensoCityFk: state.edcensoCityFk!,
      deficiency: state.deficiency,
      scholarity: state.scholarity!,

      // address
      neighborhood: state.neighborhood,
      complement: state.complement,
      addressNumber: state.addressNumber,
      address: state.address,
      cep: state.cep,
      areaOfResidence: state.areaOfResidence ?? 1,

      // education
      otherCoursesNone: state.otherCoursesNone,
      otherCoursesOther: state.otherCoursesOther,
      otherCoursesEthnicEducation: state.otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights:
          state.otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation: state.otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation: state.otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation: state.otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation: state.otherCoursesFieldEducation,
      otherCoursesNativeEducation: state.otherCoursesNativeEducation,
      otherCoursesSpecialEducation: state.otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          state.otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool: state.otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          state.otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          state.otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool: state.otherCoursesPreSchool,
      otherCoursesNursery: state.otherCoursesNursery,
      postGraduationNone: state.postGraduationNone,
      postGraduationDoctorate: state.postGraduationDoctorate,
      postGraduationMaster: state.postGraduationMaster,
      postGraduationSpecialization: state.postGraduationSpecialization,
    );

    final result = await _createInstructorsUsecase(params);

    result.fold(
      (error) => notifyError(
        error.toString(),
      ),
      (student) {
        notifySuccess("Professor cadastrado com sucesso");
      },
    );
  }

  Future edit() async {
    if (!(state.isValidFormAddress &&
        state.isValidPersonal &&
        state.isValidFormEducation)) {
      notifyError(
        "Verifique se todos os campos obrigatórios foram preenchidos",
      );

      return;
    }
    await _session.fetchCurrentSchool();
    final school = _session.state.currentSchool!;

    final params = UpdateInstructorParams(
      id: state.id!,
      schoolInepIdFk: school.inepId,
      cpf: state.cpf,
      deficiencyTypeGifted: state.deficiencyTypeGifted,
      deficiencyTypeAutism: state.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities:
          state.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          state.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability: state.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness: state.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: state.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness: state.deficiencyTypeDeafness,
      deficiencyTypeLowVision: state.deficiencyTypeLowVision,
      deficiencyTypeBlindness: state.deficiencyTypeBlindness,
      filiation2: state.filiation2,
      filiation1: state.filiation1,
      filiation: state.filiation,
      nis: state.nis,
      email: state.email,
      registerType: 'rg',
      name: state.name!,
      birthdayDate: state.birthdayDate!,
      sex: state.sex!,
      colorRace: state.colorRace!,
      nationality: state.nationality!,
      edcensoNationFk: 76,
      edcensoUfFk: state.edcensoUfFk!,
      edcensoCityFk: state.edcensoCityFk!,
      deficiency: state.deficiency,
      scholarity: state.scholarity!,

      // address
      neighborhood: state.neighborhood,
      complement: state.complement,
      addressNumber: state.addressNumber,
      address: state.address,
      cep: state.cep,
      areaOfResidence: state.areaOfResidence ?? 1,

      // education
      otherCoursesNone: state.otherCoursesNone,
      otherCoursesOther: state.otherCoursesOther,
      otherCoursesEthnicEducation: state.otherCoursesEthnicEducation,
      otherCoursesChildAndTeenageRights:
          state.otherCoursesChildAndTeenageRights,
      otherCoursesSexualEducation: state.otherCoursesSexualEducation,
      otherCoursesHumanRightsEducation: state.otherCoursesHumanRightsEducation,
      otherCoursesEnvironmentEducation: state.otherCoursesEnvironmentEducation,
      otherCoursesFieldEducation: state.otherCoursesFieldEducation,
      otherCoursesNativeEducation: state.otherCoursesNativeEducation,
      otherCoursesSpecialEducation: state.otherCoursesSpecialEducation,
      otherCoursesEducationOfYouthAndAdults:
          state.otherCoursesEducationOfYouthAndAdults,
      otherCoursesHighSchool: state.otherCoursesHighSchool,
      otherCoursesBasicEducationFinalYears:
          state.otherCoursesBasicEducationFinalYears,
      otherCoursesBasicEducationInitialYears:
          state.otherCoursesBasicEducationInitialYears,
      otherCoursesPreSchool: state.otherCoursesPreSchool,
      otherCoursesNursery: state.otherCoursesNursery,
      postGraduationNone: state.postGraduationNone,
      postGraduationDoctorate: state.postGraduationDoctorate,
      postGraduationMaster: state.postGraduationMaster,
      postGraduationSpecialization: state.postGraduationSpecialization,
    );

    final result = await _updateInstructorsUsecase(params);

    result.fold(
      (error) => notifyError(
        error.toString(),
      ),
      (teacher) => notifySuccess(
        "Dados do professor ${teacher.name} atualizados com sucesso",
      ),
    );
  }
}

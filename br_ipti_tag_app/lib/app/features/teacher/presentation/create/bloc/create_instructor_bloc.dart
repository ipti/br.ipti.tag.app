import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/create_instructor_usecase.dart';

import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../pages/address/bloc/instructor_address_states.dart';
import '../pages/education/bloc/instructor_education_states.dart';
import '../pages/personal/bloc/instructor_personal_states.dart';
import 'instructor_states.dart';

class CreateInstructorBloc extends Cubit<InstructorFormState> {
  CreateInstructorBloc(
    this._createInstructorsUsecase,
  ) : super(const InstructorInitialState());

  final CreateInstructorsUsecase _createInstructorsUsecase;

  final _session = Modular.get<SessionBloc>();

  int tabIndex = 0;

  // ignore: use_setters_to_change_properties
  void setTabIndex(int index) {
    tabIndex = index;
  }

  void nextTab() {
    emit(InstructorNextTabState(
      tabIndex: tabIndex + 1,
    ));
  }

  void notifyError(String message) {
    emit(CreateInstructorErrorState(message: message));
  }

  void notifySuccess(String message) {
    emit(CreateInstructorSuccessState(message: message));
  }

  void loadPersonalData({required InstructorPersonalState personal}) {
    final loadPersonalDataState = state.copyWith(
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
      neighborhood: address.neighborhood,
      complement: address.complement,
      addressNumber: address.number,
      address: address.address,
      cep: address.cep,
      areaOfResidence: address.residenceZone,
    );

    emit(loadAddressDataState);
  }

  void loadEducationData({required InstructorEducationState education}) {
    final loadedEducationDataState = state.copyWith(
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

  Future create() async {
    await _session.fetchCurrentSchool();
    final school = _session.state.currentSchool!;

    final params = CreateInstructorParams(
      schoolInepIdFk: school.id!,
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
      edcensoNationFk: state.edcensoNationFk!,
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
      areaOfResidence: state.areaOfResidence,

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
      (error) => notifyError(error.toString()),
      (student) {
        notifySuccess("Dados básicos do aluno cadastrados com sucesso");
        nextTab();
      },
    );
  }
}

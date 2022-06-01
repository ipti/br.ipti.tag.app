// ignore_for_file: avoid_positional_boolean_parameters

import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'instructor_education_states.dart';

class InstructorEducationBloc extends Cubit<InstructorEducationState> {
  InstructorEducationBloc() : super(const EmptyInstructorEducationState());

  final _createInstructorBloc = Modular.get<CreateInstructorBloc>();

  void setOtherCoursesNone(bool? value) =>
      emit(state.copyWith(otherCoursesNone: value));
  void setOtherCoursesOther(bool? value) =>
      emit(state.copyWith(otherCoursesOther: value));
  void setOtherCoursesEthnicEducation(bool? value) =>
      emit(state.copyWith(otherCoursesEthnicEducation: value));
  void setOtherCoursesChildAndTeenageRights(bool? value) =>
      emit(state.copyWith(otherCoursesChildAndTeenageRights: value));
  void setOtherCoursesSexualEducation(bool? value) =>
      emit(state.copyWith(otherCoursesSexualEducation: value));
  void setOtherCoursesHumanRightsEducation(bool? value) =>
      emit(state.copyWith(otherCoursesHumanRightsEducation: value));
  void setOtherCoursesEnvironmentEducation(bool? value) =>
      emit(state.copyWith(otherCoursesEnvironmentEducation: value));
  void setOtherCoursesFieldEducation(bool? value) =>
      emit(state.copyWith(otherCoursesFieldEducation: value));
  void setOtherCoursesNativeEducation(bool? value) =>
      emit(state.copyWith(otherCoursesNativeEducation: value));
  void setOtherCoursesSpecialEducation(bool? value) =>
      emit(state.copyWith(otherCoursesSpecialEducation: value));
  void setOtherCoursesEducationOfYouthAndAdults(bool? value) =>
      emit(state.copyWith(otherCoursesEducationOfYouthAndAdults: value));
  void setOtherCoursesHighSchool(bool? value) =>
      emit(state.copyWith(otherCoursesHighSchool: value));
  void setOtherCoursesBasicEducationFinalYears(bool? value) =>
      emit(state.copyWith(otherCoursesBasicEducationFinalYears: value));
  void setOtherCoursesBasicEducationInitialYears(bool? value) =>
      emit(state.copyWith(otherCoursesBasicEducationInitialYears: value));
  void setOtherCoursesPreSchool(bool? value) =>
      emit(state.copyWith(otherCoursesPreSchool: value));
  void setOtherCoursesNursery(bool? value) =>
      emit(state.copyWith(otherCoursesNursery: value));
  void setPostGraduationNone(bool? value) =>
      emit(state.copyWith(postGraduationNone: value));
  void setPostGraduationDoctorate(bool? value) =>
      emit(state.copyWith(postGraduationDoctorate: value));
  void setPostGraduationMaster(bool? value) =>
      emit(state.copyWith(postGraduationMaster: value));
  void setPostGraduationSpecialization(bool? value) =>
      emit(state.copyWith(postGraduationSpecialization: value));
  void setHighEducationInstitutionCode3Fk(bool? value) =>
      emit(state.copyWith(highEducationInstitutionCode3Fk: value));
  void setHighEducationFinalYear3(bool? value) =>
      emit(state.copyWith(highEducationFinalYear3: value));
  void setHighEducationInitialYear3(bool? value) =>
      emit(state.copyWith(highEducationInitialYear3: value));
  void setHighEducationCourseCode3Fk(bool? value) =>
      emit(state.copyWith(highEducationCourseCode3Fk: value));
  void setHighEducationFormation3(bool? value) =>
      emit(state.copyWith(highEducationFormation3: value));
  void setHighEducationSituation3(bool? value) =>
      emit(state.copyWith(highEducationSituation3: value));
  void setHighEducationInstitutionCode2Fk(bool? value) =>
      emit(state.copyWith(highEducationInstitutionCode2Fk: value));
  void setHighEducationFinalYear2(bool? value) =>
      emit(state.copyWith(highEducationFinalYear2: value));
  void setHighEducationInitialYear2(bool? value) =>
      emit(state.copyWith(highEducationInitialYear2: value));
  void setHighEducationCourseCode2Fk(bool? value) =>
      emit(state.copyWith(highEducationCourseCode2Fk: value));
  void setHighEducationFormation2(bool? value) =>
      emit(state.copyWith(highEducationFormation2: value));
  void setHighEducationSituation2(bool? value) =>
      emit(state.copyWith(highEducationSituation2: value));
  void setHighEducationInstitutionCode1Fk(bool? value) =>
      emit(state.copyWith(highEducationInstitutionCode1Fk: value));
  void setHighEducationFinalYear1(bool? value) =>
      emit(state.copyWith(highEducationFinalYear1: value));
  void setHighEducationInitialYear1(bool? value) =>
      emit(state.copyWith(highEducationInitialYear1: value));
  void setHighEducationCourseCode1Fk(bool? value) =>
      emit(state.copyWith(highEducationCourseCode1Fk: value));
  void setHighEducationFormation1(bool? value) =>
      emit(state.copyWith(highEducationFormation1: value));
  void setHighEducationSituation1(bool? value) =>
      emit(state.copyWith(highEducationSituation1: value));

  Future<void> submitEducationForm() async {
    _createInstructorBloc.loadEducationData(education: state);
    _createInstructorBloc.create();
  }
}

// ignore_for_file: avoid_positional_boolean_parameters

import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/instructor_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'instructor_education_states.dart';

class InstructorEducationBloc extends Cubit<InstructorEducationState> {
  InstructorEducationBloc()
      : super(
          const EmptyInstructorEducationState(),
        );

  final _createInstructorBloc = Modular.get<CreateInstructorBloc>();

  void setOtherCoursesNone(bool? value) => emit(
        state.copyWith(otherCoursesNone: value),
      );
  void setOtherCoursesOther(bool? value) => emit(
        state.copyWith(otherCoursesOther: value),
      );
  void setOtherCoursesEthnicEducation(bool? value) => emit(
        state.copyWith(otherCoursesEthnicEducation: value),
      );
  void setOtherCoursesChildAndTeenageRights(bool? value) => emit(
        state.copyWith(otherCoursesChildAndTeenageRights: value),
      );
  void setOtherCoursesSexualEducation(bool? value) => emit(
        state.copyWith(otherCoursesSexualEducation: value),
      );
  void setOtherCoursesHumanRightsEducation(bool? value) => emit(
        state.copyWith(otherCoursesHumanRightsEducation: value),
      );
  void setOtherCoursesEnvironmentEducation(bool? value) => emit(
        state.copyWith(otherCoursesEnvironmentEducation: value),
      );
  void setOtherCoursesFieldEducation(bool? value) => emit(
        state.copyWith(otherCoursesFieldEducation: value),
      );
  void setOtherCoursesNativeEducation(bool? value) => emit(
        state.copyWith(otherCoursesNativeEducation: value),
      );
  void setOtherCoursesSpecialEducation(bool? value) => emit(
        state.copyWith(otherCoursesSpecialEducation: value),
      );
  void setOtherCoursesEducationOfYouthAndAdults(bool? value) => emit(
        state.copyWith(otherCoursesEducationOfYouthAndAdults: value),
      );
  void setOtherCoursesHighSchool(bool? value) => emit(
        state.copyWith(otherCoursesHighSchool: value),
      );
  void setOtherCoursesBasicEducationFinalYears(bool? value) => emit(
        state.copyWith(otherCoursesBasicEducationFinalYears: value),
      );
  void setOtherCoursesBasicEducationInitialYears(bool? value) => emit(
        state.copyWith(otherCoursesBasicEducationInitialYears: value),
      );
  void setOtherCoursesPreSchool(bool? value) => emit(
        state.copyWith(otherCoursesPreSchool: value),
      );
  void setOtherCoursesNursery(bool? value) => emit(
        state.copyWith(otherCoursesNursery: value),
      );
  void setPostGraduationNone(bool? value) => emit(
        state.copyWith(postGraduationNone: value),
      );
  void setPostGraduationDoctorate(bool? value) => emit(
        state.copyWith(postGraduationDoctorate: value),
      );
  void setPostGraduationMaster(bool? value) => emit(
        state.copyWith(postGraduationMaster: value),
      );
  void setPostGraduationSpecialization(bool? value) => emit(
        state.copyWith(postGraduationSpecialization: value),
      );
  void setHighEducationInstitutionCode3Fk(bool? value) => emit(
        state.copyWith(highEducationInstitutionCode3Fk: value),
      );
  void setHighEducationFinalYear3(bool? value) => emit(
        state.copyWith(highEducationFinalYear3: value),
      );
  void setHighEducationInitialYear3(bool? value) => emit(
        state.copyWith(highEducationInitialYear3: value),
      );
  void setHighEducationCourseCode3Fk(bool? value) => emit(
        state.copyWith(highEducationCourseCode3Fk: value),
      );
  void setHighEducationFormation3(bool? value) => emit(
        state.copyWith(highEducationFormation3: value),
      );
  void setHighEducationSituation3(bool? value) => emit(
        state.copyWith(highEducationSituation3: value),
      );
  void setHighEducationInstitutionCode2Fk(bool? value) => emit(
        state.copyWith(highEducationInstitutionCode2Fk: value),
      );
  void setHighEducationFinalYear2(bool? value) => emit(
        state.copyWith(highEducationFinalYear2: value),
      );
  void setHighEducationInitialYear2(bool? value) => emit(
        state.copyWith(highEducationInitialYear2: value),
      );
  void setHighEducationCourseCode2Fk(bool? value) => emit(
        state.copyWith(highEducationCourseCode2Fk: value),
      );
  void setHighEducationFormation2(bool? value) => emit(
        state.copyWith(highEducationFormation2: value),
      );
  void setHighEducationSituation2(bool? value) => emit(
        state.copyWith(highEducationSituation2: value),
      );
  void setHighEducationInstitutionCode1Fk(bool? value) => emit(
        state.copyWith(highEducationInstitutionCode1Fk: value),
      );
  void setHighEducationFinalYear1(bool? value) => emit(
        state.copyWith(highEducationFinalYear1: value),
      );
  void setHighEducationInitialYear1(bool? value) => emit(
        state.copyWith(highEducationInitialYear1: value),
      );
  void setHighEducationCourseCode1Fk(bool? value) => emit(
        state.copyWith(highEducationCourseCode1Fk: value),
      );
  void setHighEducationFormation1(bool? value) => emit(
        state.copyWith(highEducationFormation1: value),
      );
  void setHighEducationSituation1(bool? value) => emit(
        state.copyWith(highEducationSituation1: value),
      );

  void loadInstructorEducation(InstructorFormState instructor) {
    final loadState = state.copyWith(
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
    );

    emit(loadState);
  }

  Future<void> create() async {
    _createInstructorBloc.loadEducationData(education: state);
    await _createInstructorBloc.create();
    _createInstructorBloc.goToTab(0);
  }

  Future<void> edit() async {
    _createInstructorBloc.loadEducationData(education: state);
    await _createInstructorBloc.edit();
    _createInstructorBloc.goToTab(0);
  }

  void autoUpdate() {
    stream.listen((event) {
      _createInstructorBloc.loadEducationData(education: event);
    });
  }
}

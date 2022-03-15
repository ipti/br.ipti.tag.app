import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/admission_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/current_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/previous_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/stage_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/unified_class_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_enrollment_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/util/extensions/enum_by_id.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_classroom_states.dart';

class EnrollmentClassroomBloc extends Cubit<EnrollmentClassroomState> {
  EnrollmentClassroomBloc(
      this._listClassroomsUsecase, this._createStudentEnrollmentUsecase)
      : super(const EmptyEnrollmentClassroomState());

  final ListClassroomsUsecase _listClassroomsUsecase;
  final CreateStudentEnrollmentUsecase _createStudentEnrollmentUsecase;
  final _session = Modular.get<SessionBloc>();
  final _enrollmentBloc = Modular.get<EnrollmentBloc>();

  // Turma
  void setStudentClass(String classroomid) => emit(state.copyWith(
        classroomId: classroomid,
      ));

  void setCurrentStageSituation(CurrentStageSituation currentStageSituation) =>
      emit(
        state.copyWith(currentStageSituation: currentStageSituation),
      );

  void setPreviousStageSituation(PreviousStageSituation previousStage) => emit(
        state.copyWith(previousStageSituation: previousStage),
      );

  void setStage(Stage stage) => emit(
        state.copyWith(stage: stage),
      );

  void setAdmissionType(AdmissionType admissionType) => emit(
        state.copyWith(studentEntryForm: admissionType),
      );

  void setSchoolAdmissionDate(String schoolAdmissionDate) => emit(
        state.copyWith(schoolAdmissionDate: schoolAdmissionDate),
      );

  void setUnifiedClass(UnifiedClass unifiedClass) => emit(
        state.copyWith(unifiedClass: unifiedClass),
      );

  void loadStudentEnrollment(StudentEnrollment studentEnrollment) {
    emit(state.copyWith(
      classroomId: studentEnrollment.classroomFk,
      anotherScholarizationPlace: studentEnrollment.anotherScholarizationPlace,
      currentStageSituation: CurrentStageSituation.values.byId(
        studentEnrollment.currentStageSituation,
      ),
      edcensoStageVsModalityFk: studentEnrollment.edcensoStageVsModalityFk,
      // stage: Stage.values.byId(studentEnrollment.stage),
      status: studentEnrollment.status,
      unifiedClass: UnifiedClass.values.byId(studentEnrollment.unifiedClass),
      schoolAdmissionDate: studentEnrollment.schoolAdmissionDate,
      studentEntryForm: AdmissionType.values.byId(
        studentEnrollment.studentEntryForm,
      ),
      previousStageSituation: PreviousStageSituation.values.byId(
        studentEnrollment.previousStageSituation,
      ),
    ));
  }

  Future fetchClassrooms() async {
    final schoolId = _session.state.currentSchool!.id!;
    final params = ListClassroomsParams(schoolId: schoolId);
    final result = await _listClassroomsUsecase(params);
    result.fold(
      id,
      (classrooms) => emit(state.copyWith(
        classrooms: classrooms,
      )),
    );
  }

  Future submit() async {
    final schoolId = _session.state.currentSchool;
    final studentId = _enrollmentBloc.state.student!.id!;
    final params = CreateStudentEnrollmentParams(
      schoolId: schoolId!.id!,
      studentId: studentId,
      classroomId: state.classroomId!,
      currentStageSituation: state.currentStageSituation,
      previousStageSituation: state.previousStageSituation,
      studentEntryForm: state.studentEntryForm,
      schoolAdmissionDate: state.schoolAdmissionDate,
      unifiedClass: state.unifiedClass,
    );

    await _createStudentEnrollmentUsecase(params);
  }
}

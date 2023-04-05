import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/bloc/enrollment_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../../../classroom/domain/usecases/list_classrooms_usecase.dart';
import '../../../../domain/usecases/create_student_enrollment_usecase.dart';
import '../../../../domain/usecases/update_student_enrollment_usecase.dart';
import 'enrollment_classroom_states.dart';

class EnrollmentClassroomBloc extends Cubit<EnrollmentClassroomState> {
  EnrollmentClassroomBloc(
    this._listClassroomsUsecase,
    this._createStudentEnrollmentUsecase,
    this._updateStudentEnrollmentUsecase,
  ) : super(
          const EmptyEnrollmentClassroomState(),
        );

  final ListClassroomsUsecase _listClassroomsUsecase;
  final CreateStudentEnrollmentUsecase _createStudentEnrollmentUsecase;
  final UpdateStudentEnrollmentUsecase _updateStudentEnrollmentUsecase;
  final _session = Modular.get<SessionBloc>();
  final enrollmentBloc = Modular.get<EnrollmentBloc>();

  // Turma
  void setStudentClass(int? classroomid) => emit(
        state.copyWith(
          classroomId: classroomid,
        ),
      );

  void setCurrentStageSituation(CurrentStageSituation? currentStageSituation) =>
      emit(
        state.copyWith(currentStageSituation: currentStageSituation),
      );

  void setPreviousStageSituation(PreviousStageSituation? previousStage) => emit(
        state.copyWith(previousStageSituation: previousStage),
      );

  void setStage(Stage? stage) => emit(
        state.copyWith(stage: stage),
      );

  void setAdmissionType(AdmissionType? admissionType) => emit(
        state.copyWith(studentEntryForm: admissionType),
      );

  void setSchoolAdmissionDate(String? schoolAdmissionDate) => emit(
        state.copyWith(schoolAdmissionDate: schoolAdmissionDate),
      );

  void setUnifiedClass(UnifiedClass? unifiedClass) => emit(
        state.copyWith(unifiedClass: unifiedClass),
      );

  void loadStudentEnrollment(StudentEnrollment classroom) {
    emit(
      state.copyWith(
        classroom: classroom,
        classroomId: classroom.classroom,
        anotherScholarizationPlace: classroom.anotherScholarizationPlace,
        currentStageSituation: CurrentStageSituation.values.byId(
          classroom.currentStageSituation,
        ),
        edcensoStageVsModalityFk: classroom.edcensoStageVsModality,
        // stage: Stage.values.byId(classroom),
        unifiedClass: UnifiedClass.values.byId(classroom.unifiedClass),
        schoolAdmissionDate: classroom.schoolAdmissionDate,
        studentEntryForm: AdmissionType.values.byId(
          classroom.studentEntryForm,
        ),
        previousStageSituation: PreviousStageSituation.values.byId(
          classroom.previousStageSituation,
        ),
      ),
    );
  }

  Future fetchClassrooms() async {
    final schoolId = _session.state.currentSchool?.inepId;
    final params = ClassroomParams(schoolId: schoolId);
    final result = await _listClassroomsUsecase(params);
    result.fold(
      id,
      (classrooms) => emit(
        state.copyWith(
          classrooms: classrooms,
        ),
      ),
    );
  }

  Future submit(EditMode mode) async {
    final enrollmentBloc = Modular.get<EnrollmentBloc>();

    final schoolId = _session.state.currentSchool!.inepId;
    final studentId = enrollmentBloc.student!.id!;

    switch (mode) {
      case EditMode.Create:
        final enrollment = StudentEnrollment(
          schoolIdentification: schoolId,
          studentFk: studentId,
          classroom: state.classroomId!,
          currentStageSituation: state.currentStageSituation?.id,
          previousStageSituation: state.previousStageSituation?.id,
          schoolAdmissionDate: state.schoolAdmissionDate,
          studentEntryForm: state.studentEntryForm?.id,
          unifiedClass: state.unifiedClass?.id,
          registerType: "rg",
        );
        await _create(enrollment);
        break;
      case EditMode.Edit:
        final oldStudentEnrollment = state.classroom;

        if (oldStudentEnrollment == null) return submit(EditMode.Create);

        final enrollment = oldStudentEnrollment.copyWith(
          schoolIdentification: schoolId,
          studentFk: studentId,
          classroom: state.classroomId!,
          currentStageSituation: state.currentStageSituation?.id,
          previousStageSituation: state.previousStageSituation?.id,
          schoolAdmissionDate: state.schoolAdmissionDate,
          studentEntryForm: state.studentEntryForm?.id,
          unifiedClass: state.unifiedClass?.id,
          registerType: "rg",
        );
        await _update(enrollment.id!, enrollment);
        break;
    }
  }

  Future _create(StudentEnrollment enrollment) async {
    final params = CreateStudentEnrollmentParams(
      enrollment: enrollment,
    );

    final result = await _createStudentEnrollmentUsecase(params);

    result.fold(
      (error) => enrollmentBloc.notifyError(
        error.toString(),
      ),
      (classroom) {
        enrollmentBloc.loadStudentsEnrollment(classroom);
        enrollmentBloc.notifySuccess(
          "Matricula realizadas com sucesso",
        );
      },
    );
  }

  Future _update(int id, StudentEnrollment enrollment) async {
    final params = UpdateStudentEnrollmentParams(
      enrollmentId: id,
      enrollment: enrollment,
    );

    final result = await _updateStudentEnrollmentUsecase(params);

    result.fold(
      (error) => enrollmentBloc.notifyError(
        error.toString(),
      ),
      (classroom) {
        enrollmentBloc.loadStudentsEnrollment(classroom);
        enrollmentBloc.notifySuccess(
          "Matricula atualizada com sucesso",
        );
      },
    );
  }
}

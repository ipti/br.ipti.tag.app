import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_docs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_enrollment_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_states.dart';

class EnrollmentBloc extends Cubit<EnrollmentState> {
  EnrollmentBloc(
    this._loadStudentDocsUsecase,
    this._loadStudentEnrollmentUsecase,
  ) : super(const EnrollmentState());
  final LoadStudentDocsUsecase _loadStudentDocsUsecase;
  final LoadStudentEnrollmentUsecase _loadStudentEnrollmentUsecase;

  Future fetchStudentDocs(String studentId, String schoolId) async {
    final params = LoadStudentDocsParams(studentId, schoolId);
    final result = await _loadStudentDocsUsecase(params);
    result.fold(id, setStudentDocs);
  }

  Future fetchStudentsEnrollment(String studentId, String schoolId) async {
    final params = LoadStudentEnrollmentParams(studentId, schoolId);
    final result = await _loadStudentEnrollmentUsecase(params);
    result.fold(id, setStudentEnrollment);
  }

  void setStudent(Student student) {
    emit(state.copyWith(
      student: student,
    ));
  }

  void setStudentDocs(StudentDocuments studentDocs) {
    emit(state.copyWith(
      studentDocs: studentDocs,
    ));
  }

  void setStudentEnrollment(StudentEnrollment studentEnrollment) {
    emit(state.copyWith(
      studentEnrollment: studentEnrollment,
    ));
  }

  void setTabIndex(int index) {
    emit(NextTabState(
      tabIndex: index,
      student: state.student,
      studentDocs: state.studentDocs,
    ));
  }

  void nextTab() {
    setTabIndex(state.tabIndex + 1);
  }
}

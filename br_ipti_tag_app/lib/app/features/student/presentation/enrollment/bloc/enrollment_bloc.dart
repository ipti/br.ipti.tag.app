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
  ) : super(const EnrollmentInitialState());

  final LoadStudentDocsUsecase _loadStudentDocsUsecase;
  final LoadStudentEnrollmentUsecase _loadStudentEnrollmentUsecase;

  Student? student;
  StudentDocsAddress? studentDocs;
  StudentEnrollment? studentEnrollment;

  int tabIndex = 0;

  void loadStudent(Student? student) {
    this.student = student;
    emit(
      EnrollmentLoadedState(
        student: student,
        studentDocs: studentDocs,
        studentEnrollment: studentEnrollment,
      ),
    );
  }

  void loadStudentDocs(StudentDocsAddress? studentDocs) {
    this.studentDocs = studentDocs;
    emit(EnrollmentLoadedState(
      student: student,
      studentDocs: studentDocs,
      studentEnrollment: studentEnrollment,
    ));
  }

  void loadStudentsEnrollment(StudentEnrollment studentEnrollment) {
    this.studentEnrollment = studentEnrollment;
    emit(EnrollmentLoadedState(
      student: student,
      studentDocs: studentDocs,
      studentEnrollment: studentEnrollment,
    ));
  }

  Future fetchStudentDocs(String studentId, String schoolId) async {
    final params = LoadStudentDocsParams(studentId, schoolId);
    final result = await _loadStudentDocsUsecase(params);

    result.fold(id, loadStudentDocs);
  }

  Future fetchStudentsEnrollment(String studentId, String schoolId) async {
    final params = LoadStudentEnrollmentParams(studentId, schoolId);
    final result = await _loadStudentEnrollmentUsecase(params);
    result.fold(id, loadStudentsEnrollment);
  }

  void setTabIndex(int index) {
    tabIndex = index;
  }

  void nextTab() {
    emit(EnrollmentNextTabState(
      tabIndex: tabIndex + 1,
    ));
  }

  void notifyError(String message) {
    emit(EnrollmenErrorState(message: message));
  }

  void notifySuccess(String message) {
    emit(EnrollmenSuccessState(message: message));
  }
}

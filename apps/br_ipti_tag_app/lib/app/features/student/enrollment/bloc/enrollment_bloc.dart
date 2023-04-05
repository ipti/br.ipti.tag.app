import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';import '../../domain/usecases/load_student_docs_usecase.dart';


import '../../domain/usecases/load_student_enrollment_usecase.dart';
import 'enrollment_states.dart';

class EnrollmentBloc extends Cubit<EnrollmentState> {
  EnrollmentBloc(
    this._loadStudentDocsUsecase,
    this._loadStudentEnrollmentUsecase,
  ) : super(
          const EnrollmentInitialState(),
        );

  final LoadStudentDocsUsecase _loadStudentDocsUsecase;
  final LoadStudentEnrollmentUsecase _loadStudentEnrollmentUsecase;

  StudentIdentification? student;
  StudentDocsAndAddress? studentDocs;
  StudentEnrollment? classroom;

  int tabIndex = 0;

  void loadStudent(StudentIdentification? student) {
    this.student = student;
    emit(
      EnrollmentLoadedState(
        student: student,
        studentDocs: studentDocs,
        classroom: classroom,
      ),
    );
  }

  void loadStudentDocs(StudentDocsAndAddress? studentDocs) {
    this.studentDocs = studentDocs;
    emit(
      EnrollmentLoadedState(
        student: student,
        studentDocs: studentDocs,
        classroom: classroom,
      ),
    );
  }

  void loadStudentsEnrollment(StudentEnrollment classroom) {
    this.classroom = classroom;
    emit(
      EnrollmentLoadedState(
        student: student,
        studentDocs: studentDocs,
        classroom: classroom,
      ),
    );
  }

  Future fetchStudentDocs(int studentId, String schoolId) async {
    final params = LoadStudentDocsParams(studentId, schoolId);
    final result = await _loadStudentDocsUsecase(params);

    result.fold(id, loadStudentDocs);
  }

  Future fetchStudentsEnrollment(int studentId, String schoolId) async {
    final params = LoadStudentEnrollmentParams(studentId, schoolId);
    final result = await _loadStudentEnrollmentUsecase(params);
    result.fold(id, loadStudentsEnrollment);
  }

  // ignore: use_setters_to_change_properties
  void setTabIndex(int index) {
    tabIndex = index;
  }

  void nextTab() {
    emit(
      EnrollmentNextTabState(
        tabIndex: tabIndex + 1,
      ),
    );
  }

  void notifyError(String message) {
    emit(
      EnrollmenErrorState(message: message),
    );
  }

  void notifySuccess(String message) {
    emit(
      EnrollmenSuccessState(message: message),
    );
  }
}

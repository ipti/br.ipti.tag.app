import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:equatable/equatable.dart';

abstract class EnrollmentState extends Equatable {
  const EnrollmentState();
}

class EnrollmentInitialState extends EnrollmentState {
  const EnrollmentInitialState();
  @override
  List<Object> get props => [];
}

class EnrollmentLoadedState extends EnrollmentState {
  final Student? student;
  final StudentDocsAddress? studentDocs;
  final StudentEnrollment? studentEnrollment;

  const EnrollmentLoadedState({
    this.student,
    this.studentDocs,
    this.studentEnrollment,
  });

  @override
  List<Object> get props => [
        student.hashCode,
        studentEnrollment.hashCode,
        studentDocs.hashCode,
      ];

  EnrollmentLoadedState copyWith({
    int tabIndex = 0,
    Student? student,
    StudentDocsAddress? studentDocs,
    StudentEnrollment? studentEnrollment,
  }) {
    return EnrollmentLoadedState(
      student: student ?? this.student,
      studentDocs: studentDocs ?? this.studentDocs,
      studentEnrollment: studentEnrollment ?? this.studentEnrollment,
    );
  }
}

class EnrollmentNextTabState extends EnrollmentState {
  final int tabIndex;
  const EnrollmentNextTabState({
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [tabIndex];
}

class EnrollmenErrorState extends EnrollmentState {
  final String message;
  const EnrollmenErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class EnrollmenSuccessState extends EnrollmentState {
  final String message;
  const EnrollmenSuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

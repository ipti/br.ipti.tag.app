import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

abstract class EnrollmentState extends Equatable {
  const EnrollmentState();
}

class EnrollmentInitialState extends EnrollmentState {
  const EnrollmentInitialState();
  @override
  List<Object> get props => [];
}

class EnrollmentLoadedState extends EnrollmentState {
  final StudentIdentification? student;
  final StudentDocsAndAddress? studentDocs;
  final StudentEnrollment? classroom;

  const EnrollmentLoadedState({
    this.student,
    this.studentDocs,
    this.classroom,
  });

  @override
  List<Object> get props => [
        student.hashCode,
        classroom.hashCode,
        studentDocs.hashCode,
      ];

  EnrollmentLoadedState copyWith({
    int tabIndex = 0,
    StudentIdentification? student,
    StudentDocsAndAddress? studentDocs,
    StudentEnrollment? classroom,
  }) {
    return EnrollmentLoadedState(
      student: student ?? this.student,
      studentDocs: studentDocs ?? this.studentDocs,
      classroom: classroom ?? this.classroom,
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

import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:equatable/equatable.dart';

class EnrollmentState extends Equatable {
  final Student? student;
  final StudentDocsAddress? studentDocs;
  final StudentEnrollment? studentEnrollment;

  final int tabIndex;

  const EnrollmentState({
    this.student,
    this.studentDocs,
    this.studentEnrollment,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [
        tabIndex,
        student.hashCode,
        studentEnrollment.hashCode,
        studentDocs.hashCode,
      ];

  EnrollmentState copyWith({
    int tabIndex = 0,
    Student? student,
    StudentDocsAddress? studentDocs,
    StudentEnrollment? studentEnrollment,
  }) {
    return EnrollmentState(
      tabIndex: tabIndex,
      student: student ?? this.student,
      studentDocs: studentDocs ?? this.studentDocs,
      studentEnrollment: studentEnrollment ?? this.studentEnrollment,
    );
  }
}

class NextTabState extends EnrollmentState {
  const NextTabState({
    int tabIndex = 0,
    Student? student,
    StudentDocsAddress? studentDocs,
    StudentEnrollment? studentEnrollment,
  }) : super(
          tabIndex: tabIndex,
          student: student,
          studentDocs: studentDocs,
          studentEnrollment: studentEnrollment,
        );

  @override
  List<Object> get props => [tabIndex];
}

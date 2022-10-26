import 'package:br_ipti_tag_app/app/core/util/enums/status_fetch.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class StudentListState extends Equatable {
  const StudentListState({
    required this.students,
    required this.status,
    this.error,
  });

  final Status status;
  final List<Student> students;
  final String? error;

  @override
  List<Object> get props => [students, status];

  StudentListState copyWith({
    Status? status,
    List<Student>? students,
    String? error,
  }) {
    return StudentListState(
      status: status ?? this.status,
      students: students ?? this.students,
      error: error ?? this.error,
    );
  }
}

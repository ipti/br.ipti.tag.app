import 'package:br_ipti_tag_biometry_app/core/status_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tag_sdk/tag_sdk.dart';

@immutable
class StudentListState extends Equatable {
  const StudentListState({
    required this.students,
    required this.status,
    this.error,
  });

  final Status status;
  final List<StudentIdentification> students;
  final String? error;

  @override
  List<Object> get props => [students, status];

  StudentListState copyWith({
    Status? status,
    List<StudentIdentification>? students,
    String? error,
  }) {
    return StudentListState(
      status: status ?? this.status,
      students: students ?? this.students,
      error: error ?? this.error,
    );
  }
}

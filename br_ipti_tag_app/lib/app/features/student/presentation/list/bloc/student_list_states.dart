import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class StudentListState extends Equatable {
  const StudentListState({
    required this.students,
    required this.message,
    required this.loading,
  });

  final bool loading;
  final List<Student> students;
  final String message;

  @override
  List<Object> get props => [students, message, loading];

  StudentListState copyWith({
    bool? loading,
    List<Student>? students,
    String? message,
  }) {
    return StudentListState(
      loading: loading ?? this.loading,
      students: students ?? this.students,
      message: message ?? this.message,
    );
  }
}

class EmptyState extends StudentListState {
  const EmptyState() : super(loading: false, message: "", students: const []);
}

class LoadingState extends StudentListState {
  const LoadingState({
    required bool loading,
  }) : super(loading: loading, message: "", students: const []);
}

class LoadedState extends StudentListState {
  const LoadedState({
    required List<Student> students,
  }) : super(loading: false, message: "", students: students);
}

class FailedState extends StudentListState {
  const FailedState({
    required String message,
  }) : super(loading: false, message: message, students: const []);
}

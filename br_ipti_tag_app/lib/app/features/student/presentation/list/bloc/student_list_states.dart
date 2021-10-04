import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class StudentListState extends Equatable {}

class EmptyState extends StudentListState {
  @override
  List<Object> get props => [];
}

class LoadingState extends StudentListState {
  @override
  List<Object> get props => [];
}

class LoadedState extends StudentListState {
  LoadedState({
    required this.students,
  });

  final List<Student> students;

  @override
  List<Object> get props => [];
}

class FailedState extends StudentListState {
  FailedState({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

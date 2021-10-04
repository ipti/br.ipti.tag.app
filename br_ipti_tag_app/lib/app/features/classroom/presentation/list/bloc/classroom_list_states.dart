import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ClassroomListState extends Equatable {}

class EmptyState extends ClassroomListState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ClassroomListState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ClassroomListState {
  LoadedState({
    required this.classrooms,
  });

  final List<Classroom> classrooms;

  @override
  List<Object> get props => [];
}

class FailedState extends ClassroomListState {
  FailedState({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

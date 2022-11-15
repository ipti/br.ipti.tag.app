import 'package:br_ipti_tag_app/app/core/util/enums/status_fetch.dart';
import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ClassroomListState extends Equatable {
  const ClassroomListState({
    required this.classrooms,
    required this.message,
    required this.status,
  });

  final Status status;
  final List<ClassroomEntity> classrooms;
  final String message;

  @override
  List<Object> get props => [classrooms, message, status];

  ClassroomListState copyWith({
    Status? status,
    List<ClassroomEntity>? classrooms,
    String? message,
  }) {
    return ClassroomListState(
      status: status ?? this.status,
      classrooms: classrooms ?? this.classrooms,
      message: message ?? this.message,
    );
  }
}

class EmptyState extends ClassroomListState {
  const EmptyState()
      : super(status: Status.empty, message: "", classrooms: const []);
}

class LoadingState extends ClassroomListState {
  const LoadingState()
      : super(status: Status.loading, message: "", classrooms: const []);
}

class LoadedState extends ClassroomListState {
  const LoadedState({
    required List<ClassroomEntity> classrooms,
  }) : super(status: Status.success, message: "", classrooms: classrooms);
}

class FailedState extends ClassroomListState {
  const FailedState({
    required String message,
  }) : super(status: Status.failure, message: message, classrooms: const []);
}

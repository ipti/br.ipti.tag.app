import 'package:br_ipti_tag_app/app/core/util/enums/status_fetch.dart';
import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.classrooms,
    required this.disciplines,
    required this.students,
    required this.message,
    required this.status,
  });

  final Status status;
  final List<ClassroomEntity> classrooms;
  final List<EdcensoDiscipline> disciplines;
  final List<StudentIdentification> students;
  final String message;

  @override
  List<Object> get props =>
      [classrooms, message, status, disciplines, students];

  HomeState copyWith({
    Status? status,
    List<ClassroomEntity>? classrooms,
    List<EdcensoDiscipline>? disciplines,
    List<StudentIdentification>? students,
    String? message,
  }) {
    return HomeState(
      disciplines: disciplines ?? this.disciplines,
      students: students ?? this.students,
      status: status ?? this.status,
      classrooms: classrooms ?? this.classrooms,
      message: message ?? this.message,
    );
  }
}

class EmptyState extends HomeState {
  const EmptyState()
      : super(
          status: Status.empty,
          message: "",
          classrooms: const [],
          disciplines: const [],
          students: const [],
        );
}

class LoadingState extends HomeState {
  const LoadingState()
      : super(
          status: Status.loading,
          message: "",
          classrooms: const [],
          disciplines: const [],
          students: const [],
        );
}

class LoadedState extends HomeState {
  const LoadedState({
    required List<ClassroomEntity> classrooms,
    required List<EdcensoDiscipline> disciplines,
    required List<StudentIdentification> students,
  }) : super(
          status: Status.success,
          message: "",
          classrooms: classrooms,
          disciplines: disciplines,
          students: students,
        );
}

class FailedState extends HomeState {
  const FailedState({
    required String message,
  }) : super(
          status: Status.failure,
          message: message,
          classrooms: const [],
          disciplines: const [],
          students: const [],
        );
}

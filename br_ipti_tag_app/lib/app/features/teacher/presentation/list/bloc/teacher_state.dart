import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/status.dart';
import 'package:equatable/equatable.dart';

class TeacherListState extends Equatable {
  const TeacherListState({
    required this.teachers,
    required this.message,
    required this.status,
  });

  final Status status;
  final List<Instructor> teachers;
  final String message;

  @override
  List<Object> get props => [teachers, message, status];

  TeacherListState copyWith({
    Status? status,
    List<Instructor>? teachers,
    String? message,
  }) {
    return TeacherListState(
      status: status ?? this.status,
      teachers: teachers ?? this.teachers,
      message: message ?? this.message,
    );
  }
}

class EmptyState extends TeacherListState {
  const EmptyState()
      : super(status: Status.initial, message: "", teachers: const []);
}

class LoadingState extends TeacherListState {
  const LoadingState()
      : super(status: Status.loading, message: "", teachers: const []);
}

class LoadedState extends TeacherListState {
  const LoadedState({
    required List<Instructor> teachers,
  }) : super(status: Status.success, message: "", teachers: teachers);
}

class FailedState extends TeacherListState {
  const FailedState({
    required String message,
  }) : super(status: Status.failure, message: message, teachers: const []);
}

import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:equatable/equatable.dart';

class TeacherListState extends Equatable {
  const TeacherListState({
    required this.teachers,
    required this.message,
    required this.loading,
  });

  final bool loading;
  final List<Instructor> teachers;
  final String message;

  @override
  List<Object> get props => [teachers, message, loading];

  TeacherListState copyWith({
    bool? loading,
    List<Instructor>? teachers,
    String? message,
  }) {
    return TeacherListState(
      loading: loading ?? this.loading,
      teachers: teachers ?? this.teachers,
      message: message ?? this.message,
    );
  }
}

class EmptyState extends TeacherListState {
  const EmptyState() : super(loading: false, message: "", teachers: const []);
}

class LoadingState extends TeacherListState {
  const LoadingState({
    required bool loading,
  }) : super(loading: loading, message: "", teachers: const []);
}

class LoadedState extends TeacherListState {
  const LoadedState({
    required List<Instructor> teachers,
  }) : super(loading: false, message: "", teachers: teachers);
}

class FailedState extends TeacherListState {
  const FailedState({
    required String message,
  }) : super(loading: false, message: message, teachers: const []);
}

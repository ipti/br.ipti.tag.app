import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:equatable/equatable.dart';

class ClassroomListState extends Equatable {
  const ClassroomListState({
    required this.classrooms,
    required this.message,
    required this.loading,
  });

  final bool loading;
  final List<Classroom> classrooms;
  final String message;

  @override
  List<Object> get props => [classrooms, message, loading];

  ClassroomListState copyWith({
    bool? loading,
    List<Classroom>? classrooms,
    String? message,
  }) {
    return ClassroomListState(
      loading: loading ?? this.loading,
      classrooms: classrooms ?? this.classrooms,
      message: message ?? this.message,
    );
  }
}

class EmptyState extends ClassroomListState {
  const EmptyState() : super(loading: false, message: "", classrooms: const []);
}

class LoadingState extends ClassroomListState {
  const LoadingState({
    required bool loading,
  }) : super(loading: loading, message: "", classrooms: const []);
}

class LoadedState extends ClassroomListState {
  const LoadedState({
    required List<Classroom> classrooms,
  }) : super(loading: false, message: "", classrooms: classrooms);
}

class FailedState extends ClassroomListState {
  const FailedState({
    required String message,
  }) : super(loading: false, message: message, classrooms: const []);
}

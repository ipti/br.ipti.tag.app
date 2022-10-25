part of 'frequency_cubit.dart';

class FrequencyState extends Equatable {
  const FrequencyState({
    required this.classrooms,
    required this.message,
    required this.status,
  });

  final Status status;
  final List<ClassroomEntity> classrooms;
  final String message;

  @override
  List<Object> get props => [classrooms, message, status];

  FrequencyState copyWith({
    Status? status,
    List<ClassroomEntity>? classrooms,
    String? message,
  }) {
    return FrequencyState(
      status: status ?? this.status,
      classrooms: classrooms ?? this.classrooms,
      message: message ?? this.message,
    );
  }
}

class EmptyState extends FrequencyState {
  const EmptyState()
      : super(status: Status.empty, message: "", classrooms: const []);
}

class LoadingState extends FrequencyState {
  const LoadingState()
      : super(status: Status.loading, message: "", classrooms: const []);
}

class LoadedState extends FrequencyState {
  const LoadedState({
    required List<ClassroomEntity> classrooms,
  }) : super(status: Status.success, message: "", classrooms: classrooms);
}

class FailedState extends FrequencyState {
  const FailedState({
    required String message,
  }) : super(status: Status.failure, message: message, classrooms: const []);
}

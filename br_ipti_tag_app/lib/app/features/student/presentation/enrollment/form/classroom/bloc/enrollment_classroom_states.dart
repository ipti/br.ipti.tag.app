import 'package:equatable/equatable.dart';

class EnrollmentClassroomState extends Equatable {
  const EnrollmentClassroomState({
    required this.classroomId,
  });

  final int classroomId;

  @override
  List<Object?> get props => [classroomId];

  EnrollmentClassroomState copyWith({
    int? classroomId,
  }) {
    return EnrollmentClassroomState(
      classroomId: classroomId ?? this.classroomId,
    );
  }
}

class EmptyEnrollmentClassroomState extends EnrollmentClassroomState {
  const EmptyEnrollmentClassroomState() : super(classroomId: 0);
}

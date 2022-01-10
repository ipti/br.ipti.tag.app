import 'package:equatable/equatable.dart';

class EnrollmentState extends Equatable {
  final String studentId;
  const EnrollmentState({
    required this.studentId,
  });

  @override
  List<Object> get props => [studentId];

  EnrollmentState copyWith({
    String? studentId,
  }) {
    return EnrollmentState(
      studentId: studentId ?? this.studentId,
    );
  }
}

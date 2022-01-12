import 'package:equatable/equatable.dart';

class EnrollmentState extends Equatable {
  final String studentId;
  final int tabIndex;

  const EnrollmentState({
    required this.studentId,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [studentId, tabIndex];

  EnrollmentState copyWith({
    String? studentId,
    int? tabIndex,
  }) {
    return EnrollmentState(
      studentId: studentId ?? this.studentId,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}

class NextTabState extends EnrollmentState {
  const NextTabState({required studentId, tabIndex})
      : super(studentId: studentId, tabIndex: tabIndex);

  @override
  List<Object> get props => [studentId, tabIndex];
}

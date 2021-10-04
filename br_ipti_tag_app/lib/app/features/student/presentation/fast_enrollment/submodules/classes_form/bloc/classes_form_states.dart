import 'package:equatable/equatable.dart';

class ClassesFormState extends Equatable {
  const ClassesFormState({
    this.studentClass,
  });

  final int? studentClass;

  ClassesFormState copyWith({
    int? studentClass,
  }) {
    return ClassesFormState(
      studentClass: studentClass ?? this.studentClass,
    );
  }

  @override
  List<Object?> get props => [studentClass];
}

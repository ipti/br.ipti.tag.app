import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

abstract class InstructorFormState extends Equatable {
  const InstructorFormState();
}

class InstructorFormStateLoading extends InstructorFormState {
  @override
  List<Object?> get props => [];
}

class InstructorFormStateSuccess extends InstructorFormState {
  final List<Instructor>? instructors;
  final List<EdcensoDiscipline>? disciplines;
  final String? currentInstructor;
  final String? instructorDiscipline;
  const InstructorFormStateSuccess({
    this.instructors,
    this.disciplines,
    this.currentInstructor,
    this.instructorDiscipline,
  });

  InstructorFormStateSuccess copyWith({
    List<Instructor>? instructors,
    List<EdcensoDiscipline>? disciplines,
    String? currentInstructor,
    String? instructorDiscipline,
  }) {
    return InstructorFormStateSuccess(
      instructors: instructors,
      disciplines: disciplines,
      currentInstructor: currentInstructor,
      instructorDiscipline: instructorDiscipline,
    );
  }

  @override
  List<Object?> get props =>
      [instructors, disciplines, currentInstructor, instructorDiscipline];
}

class InstructorFormStateError extends InstructorFormState {
  const InstructorFormStateError();
  @override
  List<Object?> get props => [];
}

class InstructorFormStateInsertSuccess extends InstructorFormState {
  const InstructorFormStateInsertSuccess();
  @override
  List<Object?> get props => [];
}

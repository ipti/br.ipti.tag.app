import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:equatable/equatable.dart';

abstract class InstructorFormState extends Equatable {
  const InstructorFormState();
}

class InstructorFormStateLoading extends InstructorFormState {
  @override
  List<Object?> get props => [];
}

class InstructorFormStateSuccess extends InstructorFormState {
  final List<InstructorEntity>? instructors;
  final List<EdcensoDisciplinesEntity>? disciplines;
  final String? currentInstructor;
  final String? instructorDiscipline;
  const InstructorFormStateSuccess(
      {this.instructors,
      this.disciplines,
      this.currentInstructor,
      this.instructorDiscipline});

  InstructorFormStateSuccess copyWith(
      {List<InstructorEntity>? instructors,
      List<EdcensoDisciplinesEntity>? disciplines,
      String? currentInstructor,
      String? instructorDiscipline}) {
    return InstructorFormStateSuccess(
        instructors: instructors,
        disciplines: disciplines,
        currentInstructor: currentInstructor,
        instructorDiscipline: instructorDiscipline);
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

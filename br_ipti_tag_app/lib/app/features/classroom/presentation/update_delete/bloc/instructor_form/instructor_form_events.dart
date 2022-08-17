import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:equatable/equatable.dart';

abstract class InstructorFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitInstructorForm extends InstructorFormEvent {}

class InstructorFormEventInsertError extends InstructorFormEvent {}

class InstructorFormEventInsertSuccess extends InstructorFormEvent {}

class LoadInstructorForm extends InstructorFormEvent {}

class InstructorFormEventSuccess extends InstructorFormEvent {
  final List<InstructorEntity>? instructors;
  final List<EdcensoDisciplinesEntity>? disciplines;
  final String? currentInstructor;
  final String? instructorDiscipline;

  InstructorFormEventSuccess({
    this.instructors,
    this.disciplines,
    this.currentInstructor,
    this.instructorDiscipline,
  });
}

class UpdateInstructorForm extends InstructorFormEvent {
  final String schoolInepIdFk;
  final String instructorFk;
  final String discipline1Fk;
  final int role;
  UpdateInstructorForm(
      {required this.schoolInepIdFk,
      required this.discipline1Fk,
      required this.instructorFk,
      required this.role});

  @override
  List<Object?> get props =>
      [schoolInepIdFk, discipline1Fk, instructorFk, role];
}

class SubmitUpdateInstructorForm extends InstructorFormEvent {
  final String instructorTeachingDataId;

  SubmitUpdateInstructorForm({required this.instructorTeachingDataId});
  @override
  List<Object?> get props => [instructorTeachingDataId];
}

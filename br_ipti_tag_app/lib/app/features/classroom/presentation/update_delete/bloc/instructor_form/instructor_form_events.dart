import 'package:equatable/equatable.dart';

abstract class InstructorFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitInstructorForm extends InstructorFormEvent {}

class LoadInstructorForm extends InstructorFormEvent {}

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

import 'package:equatable/equatable.dart';

abstract class EnrollmentEvent extends Equatable {
  const EnrollmentEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends EnrollmentEvent {}

class SubmitEnrollment extends EnrollmentEvent {}

class SubmitedSuccess extends EnrollmentEvent {}

class NameChanged extends EnrollmentEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class BirthdayChanged extends EnrollmentEvent {
  const BirthdayChanged(this.birtday);

  final String birtday;

  @override
  List<Object> get props => [birtday];
}

class SexChanged extends EnrollmentEvent {
  const SexChanged(this.sex);

  final int sex;

  @override
  List<Object> get props => [sex];
}

class ColorRaceChanged extends EnrollmentEvent {
  const ColorRaceChanged(this.colorRace);

  final int colorRace;

  @override
  List<Object> get props => [colorRace];
}

class FiliationChanged extends EnrollmentEvent {
  const FiliationChanged(this.filiation);

  final int filiation;

  @override
  List<Object> get props => [filiation];
}

class NationalityChanged extends EnrollmentEvent {
  const NationalityChanged(this.nationality);

  final int nationality;

  @override
  List<Object> get props => [nationality];
}

class DeficiencyChanged extends EnrollmentEvent {
  const DeficiencyChanged(this.deficiency);

  final bool deficiency;

  @override
  List<Object> get props => [deficiency];
}

class ResidenceZoneChanged extends EnrollmentEvent {
  const ResidenceZoneChanged(this.residenceZone);

  final int residenceZone;

  @override
  List<Object> get props => [residenceZone];
}

class StudentClassChanged extends EnrollmentEvent {
  const StudentClassChanged(this.classId);

  final int classId;

  @override
  List<Object> get props => [classId];
}

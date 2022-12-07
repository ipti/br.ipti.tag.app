import 'package:equatable/equatable.dart';

abstract class CreateItemStockEvent extends Equatable {
  const CreateItemStockEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends CreateItemStockEvent {}

class SubmitCreateItemStock extends CreateItemStockEvent {}

class SubmitedSuccess extends CreateItemStockEvent {}

class NameChanged extends CreateItemStockEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class BirthdayChanged extends CreateItemStockEvent {
  const BirthdayChanged(this.birtday);

  final String birtday;

  @override
  List<Object> get props => [birtday];
}

class SexChanged extends CreateItemStockEvent {
  const SexChanged(this.sex);

  final int sex;

  @override
  List<Object> get props => [sex];
}

class ColorRaceChanged extends CreateItemStockEvent {
  const ColorRaceChanged(this.colorRace);

  final int colorRace;

  @override
  List<Object> get props => [colorRace];
}

class FiliationChanged extends CreateItemStockEvent {
  const FiliationChanged(this.filiation);

  final int filiation;

  @override
  List<Object> get props => [filiation];
}

class NationalityChanged extends CreateItemStockEvent {
  const NationalityChanged(this.nationality);

  final int nationality;

  @override
  List<Object> get props => [nationality];
}

class DeficiencyChanged extends CreateItemStockEvent {
  const DeficiencyChanged({required this.deficiency});

  final bool deficiency;

  @override
  List<Object> get props => [deficiency];
}

class ResidenceZoneChanged extends CreateItemStockEvent {
  const ResidenceZoneChanged(this.residenceZone);

  final int residenceZone;

  @override
  List<Object> get props => [residenceZone];
}

class StudentClassChanged extends CreateItemStockEvent {
  const StudentClassChanged(this.classId);

  final int classId;

  @override
  List<Object> get props => [classId];
}

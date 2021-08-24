import 'package:equatable/equatable.dart';

abstract class ManageItemStockEvent extends Equatable {
  const ManageItemStockEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends ManageItemStockEvent {}

class SubmitManageItemStock extends ManageItemStockEvent {}

class SubmitedSuccess extends ManageItemStockEvent {}

class NameChanged extends ManageItemStockEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class BirthdayChanged extends ManageItemStockEvent {
  const BirthdayChanged(this.birtday);

  final String birtday;

  @override
  List<Object> get props => [birtday];
}

class SexChanged extends ManageItemStockEvent {
  const SexChanged(this.sex);

  final int sex;

  @override
  List<Object> get props => [sex];
}

class ColorRaceChanged extends ManageItemStockEvent {
  const ColorRaceChanged(this.colorRace);

  final int colorRace;

  @override
  List<Object> get props => [colorRace];
}

class FiliationChanged extends ManageItemStockEvent {
  const FiliationChanged(this.filiation);

  final int filiation;

  @override
  List<Object> get props => [filiation];
}

class NationalityChanged extends ManageItemStockEvent {
  const NationalityChanged(this.nationality);

  final int nationality;

  @override
  List<Object> get props => [nationality];
}

class DeficiencyChanged extends ManageItemStockEvent {
  const DeficiencyChanged(this.deficiency);

  final bool deficiency;

  @override
  List<Object> get props => [deficiency];
}

class ResidenceZoneChanged extends ManageItemStockEvent {
  const ResidenceZoneChanged(this.residenceZone);

  final int residenceZone;

  @override
  List<Object> get props => [residenceZone];
}

class StudentClassChanged extends ManageItemStockEvent {
  const StudentClassChanged(this.classId);

  final int classId;

  @override
  List<Object> get props => [classId];
}

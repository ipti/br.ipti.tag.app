import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends StockEvent {}

class SubmitStock extends StockEvent {}

class SubmitedSuccess extends StockEvent {}

class NameChanged extends StockEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class BirthdayChanged extends StockEvent {
  const BirthdayChanged(this.birtday);

  final String birtday;

  @override
  List<Object> get props => [birtday];
}

class SexChanged extends StockEvent {
  const SexChanged(this.sex);

  final int sex;

  @override
  List<Object> get props => [sex];
}

class ColorRaceChanged extends StockEvent {
  const ColorRaceChanged(this.colorRace);

  final int colorRace;

  @override
  List<Object> get props => [colorRace];
}

class FiliationChanged extends StockEvent {
  const FiliationChanged(this.filiation);

  final int filiation;

  @override
  List<Object> get props => [filiation];
}

class NationalityChanged extends StockEvent {
  const NationalityChanged(this.nationality);

  final int nationality;

  @override
  List<Object> get props => [nationality];
}

class DeficiencyChanged extends StockEvent {
  const DeficiencyChanged({@required this.deficiency});

  final bool deficiency;

  @override
  List<Object> get props => [deficiency];
}

class ResidenceZoneChanged extends StockEvent {
  const ResidenceZoneChanged(this.residenceZone);

  final int residenceZone;

  @override
  List<Object> get props => [residenceZone];
}

class StudentClassChanged extends StockEvent {
  const StudentClassChanged(this.classId);

  final int classId;

  @override
  List<Object> get props => [classId];
}

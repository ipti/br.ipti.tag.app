import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PersonalFormEvent extends Equatable {
  const PersonalFormEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends PersonalFormEvent {}

class SubmitPersonalForm extends PersonalFormEvent {}

class SubmitedSuccess extends PersonalFormEvent {}

class NameChanged extends PersonalFormEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class BirthdayChanged extends PersonalFormEvent {
  const BirthdayChanged(this.birtday);

  final String birtday;

  @override
  List<Object> get props => [birtday];
}

class SexChanged extends PersonalFormEvent {
  const SexChanged(this.sex);

  final int sex;

  @override
  List<Object> get props => [sex];
}

class ColorRaceChanged extends PersonalFormEvent {
  const ColorRaceChanged(this.colorRace);

  final int colorRace;

  @override
  List<Object> get props => [colorRace];
}

class FiliationChanged extends PersonalFormEvent {
  const FiliationChanged(this.filiation);

  final int filiation;

  @override
  List<Object> get props => [filiation];
}

class NationalityChanged extends PersonalFormEvent {
  const NationalityChanged(this.nationality);

  final int nationality;

  @override
  List<Object> get props => [nationality];
}

class DeficiencyChanged extends PersonalFormEvent {
  const DeficiencyChanged({@required this.deficiency});

  final bool deficiency;

  @override
  List<Object> get props => [deficiency];
}

class FoodRestrictionChanged extends PersonalFormEvent {
  const FoodRestrictionChanged(this.foodRestrictions);

  final String foodRestrictions;

  @override
  List<Object> get props => [foodRestrictions];
}

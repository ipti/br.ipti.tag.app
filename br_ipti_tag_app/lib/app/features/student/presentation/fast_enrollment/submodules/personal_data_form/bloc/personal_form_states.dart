import 'package:equatable/equatable.dart';

class PersonalFormState extends Equatable {
  const PersonalFormState({
    this.name,
    this.birthday,
    this.sex,
    this.colorRace,
    this.filiation,
    this.nationality,
    this.deficiency,
    this.foodRestrictions,
  });

  final String name;
  final String birthday;
  final int sex;
  final int colorRace;
  final int filiation;
  final int nationality;
  final bool deficiency;
  final String foodRestrictions;

  PersonalFormState copyWith({
    String name,
    String birthday,
    int sex,
    int colorRace,
    int filiation,
    int nationality,
    bool deficiency,
    int studentClass,
    String foodRestrictions,
  }) {
    return PersonalFormState(
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      sex: sex ?? this.sex,
      colorRace: colorRace ?? this.colorRace,
      filiation: filiation ?? this.filiation,
      nationality: nationality ?? this.nationality,
      deficiency: deficiency ?? this.deficiency,
      foodRestrictions: foodRestrictions ?? this.foodRestrictions,
    );
  }

  @override
  List<Object> get props => [
        name,
        birthday,
        sex,
        colorRace,
        filiation,
        nationality,
        deficiency,
        foodRestrictions,
      ];
}

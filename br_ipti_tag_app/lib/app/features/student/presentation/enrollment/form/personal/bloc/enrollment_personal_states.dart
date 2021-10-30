import 'package:equatable/equatable.dart';

class EnrollmentPersonalState extends Equatable {
  const EnrollmentPersonalState({
    required this.name,
    required this.birthday,
    required this.sex,
    required this.colorRace,
    required this.filiation,
    required this.nationality,
    required this.deficiency,
    required this.foodRestrictions,
  });

  final String name;
  final String birthday;
  final int sex;
  final int colorRace;
  final int filiation;
  final int nationality;
  final bool deficiency;
  final String foodRestrictions;

  @override
  List<Object?> get props => [];

  EnrollmentPersonalState copyWith({
    String? name,
    String? birthday,
    int? sex,
    int? colorRace,
    int? filiation,
    int? nationality,
    bool? deficiency,
    String? foodRestrictions,
  }) {
    return EnrollmentPersonalState(
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
}

class EmptyEnrollmentPersonalState extends EnrollmentPersonalState {
  const EmptyEnrollmentPersonalState()
      : super(
            name: "",
            birthday: "",
            colorRace: 0,
            deficiency: false,
            filiation: 0,
            foodRestrictions: "",
            nationality: 0,
            sex: 0);
}

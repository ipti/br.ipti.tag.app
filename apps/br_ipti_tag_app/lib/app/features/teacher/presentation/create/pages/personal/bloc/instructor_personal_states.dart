import 'package:equatable/equatable.dart';

class InstructorPersonalState extends Equatable {
  final String? cpf;
  final bool deficiencyTypeGifted;
  final bool deficiencyTypeAutism;
  final bool deficiencyTypeMultipleDisabilities;
  final bool deficiencyTypeIntelectualDisability;
  final bool deficiencyTypePhisicalDisability;
  final bool deficiencyTypeDeafblindness;
  final bool deficiencyTypeDisabilityHearing;
  final bool deficiencyTypeDeafness;
  final bool deficiencyTypeLowVision;
  final bool deficiencyTypeBlindness;
  final String? filiation2;
  final String? filiation1;
  final int? filiation;
  final String? nis;
  final String? email;
  final String? registerType;
  final String? name;
  final String? birthdayDate;
  final int? sex;
  final int? colorRace;
  final int? nationality;
  final int? edcensoNationFk;
  final int? edcensoUfFk;
  final int? edcensoCityFk;
  final bool deficiency;
  final int? scholarity;

  const InstructorPersonalState({
    this.cpf,
    this.deficiencyTypeGifted = false,
    this.deficiencyTypeAutism = false,
    this.deficiencyTypeMultipleDisabilities = false,
    this.deficiencyTypeIntelectualDisability = false,
    this.deficiencyTypePhisicalDisability = false,
    this.deficiencyTypeDeafblindness = false,
    this.deficiencyTypeDisabilityHearing = false,
    this.deficiencyTypeDeafness = false,
    this.deficiencyTypeLowVision = false,
    this.deficiencyTypeBlindness = false,
    this.filiation2,
    this.filiation1,
    this.filiation,
    this.nis,
    this.email,
    this.registerType,
    this.name,
    this.birthdayDate,
    this.sex,
    this.colorRace,
    this.nationality,
    this.edcensoNationFk,
    this.edcensoUfFk,
    this.edcensoCityFk,
    this.deficiency = false,
    this.scholarity,
  });

  @override
  List<Object> get props {
    return [
      cpf ?? "",
      deficiencyTypeGifted,
      deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness,
      deficiencyTypeLowVision,
      deficiencyTypeBlindness,
      filiation2 ?? "",
      filiation1 ?? "",
      filiation ?? "",
      nis ?? "",
      email ?? "",
      registerType ?? "",
      name ?? "",
      birthdayDate ?? "",
      sex ?? "",
      colorRace ?? "",
      nationality ?? "",
      edcensoNationFk ?? "",
      edcensoUfFk ?? "",
      edcensoCityFk ?? "",
      deficiency,
      scholarity ?? "",
    ];
  }

  InstructorPersonalState copyWith({
    String? cpf,
    bool? deficiencyTypeGifted,
    bool? deficiencyTypeAutism,
    bool? deficiencyTypeMultipleDisabilities,
    bool? deficiencyTypeIntelectualDisability,
    bool? deficiencyTypePhisicalDisability,
    bool? deficiencyTypeDeafblindness,
    bool? deficiencyTypeDisabilityHearing,
    bool? deficiencyTypeDeafness,
    bool? deficiencyTypeLowVision,
    bool? deficiencyTypeBlindness,
    String? filiation2,
    String? filiation1,
    int? filiation,
    String? nis,
    String? email,
    String? registerType,
    String? name,
    String? birthdayDate,
    int? sex,
    int? colorRace,
    int? nationality,
    int? edcensoNationFk,
    int? edcensoUfFk,
    int? edcensoCityFk,
    bool? deficiency,
    int? scholarity,
  }) {
    return InstructorPersonalState(
      cpf: cpf ?? this.cpf,
      deficiencyTypeGifted: deficiencyTypeGifted ?? this.deficiencyTypeGifted,
      deficiencyTypeAutism: deficiencyTypeAutism ?? this.deficiencyTypeAutism,
      deficiencyTypeMultipleDisabilities: deficiencyTypeMultipleDisabilities ??
          this.deficiencyTypeMultipleDisabilities,
      deficiencyTypeIntelectualDisability:
          deficiencyTypeIntelectualDisability ??
              this.deficiencyTypeIntelectualDisability,
      deficiencyTypePhisicalDisability: deficiencyTypePhisicalDisability ??
          this.deficiencyTypePhisicalDisability,
      deficiencyTypeDeafblindness:
          deficiencyTypeDeafblindness ?? this.deficiencyTypeDeafblindness,
      deficiencyTypeDisabilityHearing: deficiencyTypeDisabilityHearing ??
          this.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafness:
          deficiencyTypeDeafness ?? this.deficiencyTypeDeafness,
      deficiencyTypeLowVision:
          deficiencyTypeLowVision ?? this.deficiencyTypeLowVision,
      deficiencyTypeBlindness:
          deficiencyTypeBlindness ?? this.deficiencyTypeBlindness,
      filiation2: filiation2 ?? this.filiation2,
      filiation1: filiation1 ?? this.filiation1,
      filiation: filiation ?? this.filiation,
      nis: nis ?? this.nis,
      email: email ?? this.email,
      registerType: registerType ?? this.registerType,
      name: name ?? this.name,
      birthdayDate: birthdayDate ?? this.birthdayDate,
      sex: sex ?? this.sex,
      colorRace: colorRace ?? this.colorRace,
      nationality: nationality ?? this.nationality,
      edcensoNationFk: edcensoNationFk ?? this.edcensoNationFk,
      edcensoUfFk: edcensoUfFk ?? this.edcensoUfFk,
      edcensoCityFk: edcensoCityFk ?? this.edcensoCityFk,
      deficiency: deficiency ?? this.deficiency,
      scholarity: scholarity ?? this.scholarity,
    );
  }
}

class EmptyInstructorPersonalState extends InstructorPersonalState {
  const EmptyInstructorPersonalState();
}

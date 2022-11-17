import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

class EnrollmentPersonalState extends Equatable {
  final String name;
  final String birthday;
  final int sex;
  final int colorRace;
  final int filiation;
  final int nationality;
  final bool deficiency;
  final String foodRestrictions;
  final bool? deficiencyTypeBlindness;
  final bool? deficiencyTypeLowVision;
  final bool? deficiencyTypeDeafness;
  final bool? deficiencyTypeDisabilityHearing;
  final bool? deficiencyTypeDeafblindness;
  final bool? deficiencyTypePhisicalDisability;
  final bool? deficiencyTypeIntelectualDisability;
  final bool? deficiencyTypeMultipleDisabilities;
  final bool? deficiencyTypeAutism;
  final bool? deficiencyTypeAspengerSyndrome;
  final bool? deficiencyTypeRettSyndrome;
  final bool? deficiencyTypeChildhoodDisintegrativeDisorder;
  final bool? deficiencyTypeGifted;
  final StudentIdentification? student;

  const EnrollmentPersonalState({
    required this.name,
    required this.birthday,
    required this.sex,
    required this.colorRace,
    required this.filiation,
    required this.nationality,
    required this.deficiency,
    required this.foodRestrictions,
    this.deficiencyTypeBlindness,
    this.deficiencyTypeLowVision,
    this.deficiencyTypeDeafness,
    this.deficiencyTypeDisabilityHearing,
    this.deficiencyTypeDeafblindness,
    this.deficiencyTypePhisicalDisability,
    this.deficiencyTypeIntelectualDisability,
    this.deficiencyTypeMultipleDisabilities,
    this.deficiencyTypeAutism,
    this.deficiencyTypeAspengerSyndrome,
    this.deficiencyTypeRettSyndrome,
    this.deficiencyTypeChildhoodDisintegrativeDisorder,
    this.deficiencyTypeGifted,
    this.student,
  });

  EnrollmentPersonalState copyWith({
    String? name,
    String? birthday,
    int? sex,
    int? colorRace,
    int? filiation,
    int? nationality,
    bool? deficiency,
    String? foodRestrictions,
    bool? deficiencyTypeBlindness,
    bool? deficiencyTypeLowVision,
    bool? deficiencyTypeDeafness,
    bool? deficiencyTypeDisabilityHearing,
    bool? deficiencyTypeDeafblindness,
    bool? deficiencyTypePhisicalDisability,
    bool? deficiencyTypeIntelectualDisability,
    bool? deficiencyTypeMultipleDisabilities,
    bool? deficiencyTypeAutism,
    bool? deficiencyTypeAspengerSyndrome,
    bool? deficiencyTypeRettSyndrome,
    bool? deficiencyTypeChildhoodDisintegrativeDisorder,
    bool? deficiencyTypeGifted,
    StudentIdentification? student,
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
      deficiencyTypeBlindness:
          deficiencyTypeBlindness ?? this.deficiencyTypeBlindness,
      deficiencyTypeLowVision:
          deficiencyTypeLowVision ?? this.deficiencyTypeLowVision,
      deficiencyTypeDeafness:
          deficiencyTypeDeafness ?? this.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing: deficiencyTypeDisabilityHearing ??
          this.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness:
          deficiencyTypeDeafblindness ?? this.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability: deficiencyTypePhisicalDisability ??
          this.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          deficiencyTypeIntelectualDisability ??
              this.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities: deficiencyTypeMultipleDisabilities ??
          this.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: deficiencyTypeAutism ?? this.deficiencyTypeAutism,
      deficiencyTypeAspengerSyndrome:
          deficiencyTypeAspengerSyndrome ?? this.deficiencyTypeAspengerSyndrome,
      deficiencyTypeRettSyndrome:
          deficiencyTypeRettSyndrome ?? this.deficiencyTypeRettSyndrome,
      deficiencyTypeChildhoodDisintegrativeDisorder:
          deficiencyTypeChildhoodDisintegrativeDisorder ??
              this.deficiencyTypeChildhoodDisintegrativeDisorder,
      deficiencyTypeGifted: deficiencyTypeGifted ?? this.deficiencyTypeGifted,
      student: student ?? this.student,
    );
  }

  @override
  List<Object> get props {
    return [
      name,
      birthday,
      sex,
      colorRace,
      filiation,
      nationality,
      deficiency,
      foodRestrictions,
      deficiencyTypeBlindness ?? false,
      deficiencyTypeLowVision ?? false,
      deficiencyTypeDeafness ?? false,
      deficiencyTypeDisabilityHearing ?? false,
      deficiencyTypeDeafblindness ?? false,
      deficiencyTypePhisicalDisability ?? false,
      deficiencyTypeIntelectualDisability ?? false,
      deficiencyTypeMultipleDisabilities ?? false,
      deficiencyTypeAutism ?? false,
      deficiencyTypeAspengerSyndrome ?? false,
      deficiencyTypeRettSyndrome ?? false,
      deficiencyTypeChildhoodDisintegrativeDisorder ?? false,
      deficiencyTypeGifted ?? false,
    ];
  }
}

class EmptyEnrollmentPersonalState extends EnrollmentPersonalState {
  const EmptyEnrollmentPersonalState()
      : super(
          name: "",
          birthday: "",
          colorRace: 1,
          deficiency: false,
          filiation: 1,
          foodRestrictions: "",
          nationality: 1,
          sex: 1,
        );
}

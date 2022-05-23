import 'dart:convert';

import '../../domain/entities/instructor.dart';

class InstructorModel extends Instructor {
  InstructorModel({
    String? registerType,
    String? schoolInepIdFk,
    String? inepId,
    String? name,
    String? email,
    String? nis,
    String? birthdayDate,
    int? sex,
    int? colorRace,
    bool? filiation,
    String? filiation1,
    String? filiation2,
    int? nationality,
    int? edcensoNationFk,
    int? edcensoUfFk,
    int? edcensoCityFk,
    bool? deficiency,
    bool? deficiencyTypeBlindness,
    bool? deficiencyTypeLowVision,
    bool? deficiencyTypeDeafness,
    bool? deficiencyTypeDisabilityHearing,
    bool? deficiencyTypeDeafblindness,
    bool? deficiencyTypePhisicalDisability,
    bool? deficiencyTypeIntelectualDisability,
    bool? deficiencyTypeMultipleDisabilities,
    bool? deficiencyTypeAutism,
    bool? deficiencyTypeGifted,
    int? hash,
  }) : super(
          registerType: registerType,
          schoolInepIdFk: schoolInepIdFk,
          inepId: inepId,
          name: name,
          email: email,
          nis: nis,
          birthdayDate: birthdayDate,
          sex: sex,
          colorRace: colorRace,
          filiation: filiation,
          filiation1: filiation1,
          filiation2: filiation2,
          nationality: nationality,
          edcensoNationFk: edcensoNationFk,
          edcensoUfFk: edcensoUfFk,
          edcensoCityFk: edcensoCityFk,
          deficiency: deficiency,
          deficiencyTypeBlindness: deficiencyTypeBlindness,
          deficiencyTypeLowVision: deficiencyTypeLowVision,
          deficiencyTypeDeafness: deficiencyTypeDeafness,
          deficiencyTypeDisabilityHearing: deficiencyTypeDisabilityHearing,
          deficiencyTypeDeafblindness: deficiencyTypeDeafblindness,
          deficiencyTypePhisicalDisability: deficiencyTypePhisicalDisability,
          deficiencyTypeIntelectualDisability:
              deficiencyTypeIntelectualDisability,
          deficiencyTypeMultipleDisabilities:
              deficiencyTypeMultipleDisabilities,
          deficiencyTypeAutism: deficiencyTypeAutism,
          deficiencyTypeGifted: deficiencyTypeGifted,
          hash: hash,
        );

  InstructorModel copyWith({
    String? registerType,
    String? schoolInepIdFk,
    String? inepId,
    String? name,
    String? email,
    String? nis,
    String? birthdayDate,
    int? sex,
    int? colorRace,
    bool? filiation,
    String? filiation1,
    String? filiation2,
    int? nationality,
    int? edcensoNationFk,
    int? edcensoUfFk,
    int? edcensoCityFk,
    bool? deficiency,
    bool? deficiencyTypeBlindness,
    bool? deficiencyTypeLowVision,
    bool? deficiencyTypeDeafness,
    bool? deficiencyTypeDisabilityHearing,
    bool? deficiencyTypeDeafblindness,
    bool? deficiencyTypePhisicalDisability,
    bool? deficiencyTypeIntelectualDisability,
    bool? deficiencyTypeMultipleDisabilities,
    bool? deficiencyTypeAutism,
    bool? deficiencyTypeGifted,
    int? hash,
  }) {
    return InstructorModel(
      registerType: registerType,
      schoolInepIdFk: schoolInepIdFk,
      inepId: inepId,
      name: name,
      email: email,
      nis: nis,
      birthdayDate: birthdayDate,
      sex: sex,
      colorRace: colorRace,
      filiation: filiation,
      filiation1: filiation1,
      filiation2: filiation2,
      nationality: nationality,
      edcensoNationFk: edcensoNationFk,
      edcensoUfFk: edcensoUfFk,
      edcensoCityFk: edcensoCityFk,
      deficiency: deficiency,
      deficiencyTypeBlindness: deficiencyTypeBlindness,
      deficiencyTypeLowVision: deficiencyTypeLowVision,
      deficiencyTypeDeafness: deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing: deficiencyTypeDisabilityHearing ??
          this.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness: deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability: deficiencyTypePhisicalDisability ??
          this.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          deficiencyTypeIntelectualDisability ??
              this.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities: deficiencyTypeMultipleDisabilities ??
          this.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: deficiencyTypeAutism,
      deficiencyTypeGifted: deficiencyTypeGifted,
      hash: hash,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'registerType': registerType,
      'schoolInepIdFk': schoolInepIdFk,
      'inepId': inepId,
      'name': name,
      'email': email,
      'nis': nis,
      'birthdayDate': birthdayDate,
      'sex': sex,
      'colorRace': colorRace,
      'filiation': filiation,
      'filiation1': filiation1,
      'filiation2': filiation2,
      'nationality': nationality,
      'edcensoNationFk': edcensoNationFk,
      'edcensoUfFk': edcensoUfFk,
      'edcensoCityFk': edcensoCityFk,
      'deficiency': deficiency,
      'deficiencyTypeBlindness': deficiencyTypeBlindness,
      'deficiencyTypeLowVision': deficiencyTypeLowVision,
      'deficiencyTypeDeafness': deficiencyTypeDeafness,
      'deficiencyTypeDisabilityHearing': deficiencyTypeDisabilityHearing,
      'deficiencyTypeDeafblindness': deficiencyTypeDeafblindness,
      'deficiencyTypePhisicalDisability': deficiencyTypePhisicalDisability,
      'deficiencyTypeIntelectualDisability':
          deficiencyTypeIntelectualDisability,
      'deficiencyTypeMultipleDisabilities': deficiencyTypeMultipleDisabilities,
      'deficiencyTypeAutism': deficiencyTypeAutism,
      'deficiencyTypeGifted': deficiencyTypeGifted,
      'hash': hash,
    };
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
      registerType: map['registerType'],
      schoolInepIdFk: map['schoolInepIdFk'],
      inepId: map['inepId'],
      name: map['name'],
      email: map['email'],
      nis: map['nis'],
      birthdayDate: map['birthdayDate'],
      sex: map['sex'],
      colorRace: map['colorRace'],
      filiation: map['filiation'],
      filiation1: map['filiation1'],
      filiation2: map['filiation2'],
      nationality: map['nationality'],
      edcensoNationFk: map['edcensoNationFk'],
      edcensoUfFk: map['edcensoUfFk'],
      edcensoCityFk: map['edcensoCityFk'],
      deficiency: map['deficiency'],
      deficiencyTypeBlindness: map['deficiencyTypeBlindness'],
      deficiencyTypeLowVision: map['deficiencyTypeLowVision'],
      deficiencyTypeDeafness: map['deficiencyTypeDeafness'],
      deficiencyTypeDisabilityHearing: map['deficiencyTypeDisabilityHearing'],
      deficiencyTypeDeafblindness: map['deficiencyTypeDeafblindness'],
      deficiencyTypePhisicalDisability: map['deficiencyTypePhisicalDisability'],
      deficiencyTypeIntelectualDisability:
          map['deficiencyTypeIntelectualDisability'],
      deficiencyTypeMultipleDisabilities:
          map['deficiencyTypeMultipleDisabilities'],
      deficiencyTypeAutism: map['deficiencyTypeAutism'],
      deficiencyTypeGifted: map['deficiencyTypeGifted'],
      hash: map['hash'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstructorModel.fromJson(String source) =>
      InstructorModel.fromMap(json.decode(source));

  factory InstructorModel.fromEntity(Instructor instructor) {
    return InstructorModel(
      registerType: instructor.registerType,
      schoolInepIdFk: instructor.schoolInepIdFk,
      inepId: instructor.inepId,
      name: instructor.name,
      email: instructor.email,
      nis: instructor.nis,
      birthdayDate: instructor.birthdayDate,
      sex: instructor.sex,
      colorRace: instructor.colorRace,
      filiation: instructor.filiation,
      filiation1: instructor.filiation1,
      filiation2: instructor.filiation2,
      nationality: instructor.nationality,
      edcensoNationFk: instructor.edcensoNationFk,
      edcensoUfFk: instructor.edcensoUfFk,
      edcensoCityFk: instructor.edcensoCityFk,
      deficiency: instructor.deficiency,
      deficiencyTypeBlindness: instructor.deficiencyTypeBlindness,
      deficiencyTypeLowVision: instructor.deficiencyTypeLowVision,
      deficiencyTypeDeafness: instructor.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing:
          instructor.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness: instructor.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability:
          instructor.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          instructor.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities:
          instructor.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: instructor.deficiencyTypeAutism,
      deficiencyTypeGifted: instructor.deficiencyTypeGifted,
      hash: instructor.hash,
    );
  }

  @override
  String toString() {
    return '''
      InstructorModel(registerType: $registerType, 
      schoolInepIdFk: $schoolInepIdFk, inepId: $inepId, name: $name, 
      email: $email, nis: $nis, birthdayDate: $birthdayDate, sex: $sex, 
      colorRace: $colorRace, filiation: $filiation, filiation1: $filiation1, 
      filiation2: $filiation2, nationality: $nationality, 
      edcensoNationFk: $edcensoNationFk, edcensoUfFk: $edcensoUfFk, 
      edcensoCityFk: $edcensoCityFk, deficiency: $deficiency, 
      deficiencyTypeBlindness: $deficiencyTypeBlindness, 
      deficiencyTypeLowVision: $deficiencyTypeLowVision, 
      deficiencyTypeDeafness: $deficiencyTypeDeafness, 
      deficiencyTypeDisabilityHearing: $deficiencyTypeDisabilityHearing, 
      deficiencyTypeDeafblindness: $deficiencyTypeDeafblindness, 
      deficiencyTypePhisicalDisability: $deficiencyTypePhisicalDisability, 
      deficiencyTypeIntelectualDisability: $deficiencyTypeIntelectualDisability, 
      deficiencyTypeMultipleDisabilities: $deficiencyTypeMultipleDisabilities, 
      deficiencyTypeAutism: $deficiencyTypeAutism, 
      deficiencyTypeGifted: $deficiencyTypeGifted, hash: $hash)
    ''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InstructorModel &&
        other.registerType == registerType &&
        other.schoolInepIdFk == schoolInepIdFk &&
        other.inepId == inepId &&
        other.name == name &&
        other.email == email &&
        other.nis == nis &&
        other.birthdayDate == birthdayDate &&
        other.sex == sex &&
        other.colorRace == colorRace &&
        other.filiation == filiation &&
        other.filiation1 == filiation1 &&
        other.filiation2 == filiation2 &&
        other.nationality == nationality &&
        other.edcensoNationFk == edcensoNationFk &&
        other.edcensoUfFk == edcensoUfFk &&
        other.edcensoCityFk == edcensoCityFk &&
        other.deficiency == deficiency &&
        other.deficiencyTypeBlindness == deficiencyTypeBlindness &&
        other.deficiencyTypeLowVision == deficiencyTypeLowVision &&
        other.deficiencyTypeDeafness == deficiencyTypeDeafness &&
        other.deficiencyTypeDisabilityHearing ==
            deficiencyTypeDisabilityHearing &&
        other.deficiencyTypeDeafblindness == deficiencyTypeDeafblindness &&
        other.deficiencyTypePhisicalDisability ==
            deficiencyTypePhisicalDisability &&
        other.deficiencyTypeIntelectualDisability ==
            deficiencyTypeIntelectualDisability &&
        other.deficiencyTypeMultipleDisabilities ==
            deficiencyTypeMultipleDisabilities &&
        other.deficiencyTypeAutism == deficiencyTypeAutism &&
        other.deficiencyTypeGifted == deficiencyTypeGifted &&
        other.hash == hash;
  }

  @override
  int get hashCode {
    return registerType.hashCode ^
        schoolInepIdFk.hashCode ^
        inepId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        nis.hashCode ^
        birthdayDate.hashCode ^
        sex.hashCode ^
        colorRace.hashCode ^
        filiation.hashCode ^
        filiation1.hashCode ^
        filiation2.hashCode ^
        nationality.hashCode ^
        edcensoNationFk.hashCode ^
        edcensoUfFk.hashCode ^
        edcensoCityFk.hashCode ^
        deficiency.hashCode ^
        deficiencyTypeBlindness.hashCode ^
        deficiencyTypeLowVision.hashCode ^
        deficiencyTypeDeafness.hashCode ^
        deficiencyTypeDisabilityHearing.hashCode ^
        deficiencyTypeDeafblindness.hashCode ^
        deficiencyTypePhisicalDisability.hashCode ^
        deficiencyTypeIntelectualDisability.hashCode ^
        deficiencyTypeMultipleDisabilities.hashCode ^
        deficiencyTypeAutism.hashCode ^
        deficiencyTypeGifted.hashCode ^
        hash.hashCode;
  }
}

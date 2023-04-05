import 'package:freezed_annotation/freezed_annotation.dart';
part 'instructor.freezed.dart';
part 'instructor.g.dart';

@freezed
class Instructor with _$Instructor {
  const factory Instructor({
  int? id,
  int? sex,
  String? registerType,
  String? schoolInepIdFk,
  String? inepId,
  String? name,
  String? civilName,
  String? email,
  String? nis,
  String? birthdayDate,
  int? colorRace,
  bool? filiation,
  String? filiation1,
  String? filiation2,
  int? nationality,
  int? edcensoNationFk,
  int? edcensoUfFk,
  int? edcensoCityFk,
  @Default(false) bool deficiency,
  @Default(false) bool deficiencyTypeBlindness,
  @Default(false) bool deficiencyTypeLowVision,
  @Default(false) bool deficiencyTypeDeafness,
  @Default(false) bool deficiencyTypeDisabilityHearing,
  @Default(false) bool deficiencyTypeDeafblindness,
  @Default(false) bool deficiencyTypePhisicalDisability,
  @Default(false) bool deficiencyTypeIntelectualDisability,
  @Default(false) bool deficiencyTypeMultipleDisabilities,
  @Default(false) bool deficiencyTypeAutism,
  @Default(false) bool deficiencyTypeGifted,
  String? hash,
  int? usersFk,
  }) = _Instructor;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const Instructor._();

  /// Converts a JSON [Map] into a [Instructor] instance
  factory Instructor.fromJson(Map<String, dynamic> json) =>
      _$InstructorFromJson(json);
}

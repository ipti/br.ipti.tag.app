import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_school.freezed.dart';
part 'auth_school.g.dart';

@freezed
class AuthSchool with _$AuthSchool {
  const factory AuthSchool({
    required String inepId,
    required String name,
  }) = _AuthSchool;

  factory AuthSchool.fromJson(Map<String, Object?> json) =>
      _$AuthSchoolFromJson(json);
}

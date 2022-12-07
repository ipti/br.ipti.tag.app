import 'package:tag_sdk/src/features/auth/domain/entities/auth_school.dart';

class User {
  final int? id;
  final String? name;
  final List<AuthSchool>? schools;
  final String? username;
  final int? active;

  User({this.id, this.name, this.schools, this.username, this.active});
}

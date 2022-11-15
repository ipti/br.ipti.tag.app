import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

class User {
  final int? id;
  final String? name;
  final List<School>? schools;
  final String? username;
  final int? active;

  User({this.id, this.name, this.schools, this.username, this.active});
}

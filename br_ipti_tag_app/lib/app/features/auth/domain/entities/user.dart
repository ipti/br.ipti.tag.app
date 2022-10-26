import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';

class User {
  final int? id;
  final String? name;
  final List<School>? schools;
  final String? username;
  final int? active;

  User({this.id, this.name, this.schools, this.username, this.active});
}

import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';

class User {
  String? id;
  String? name;
  List<School>? schools;
  String? username;

  User({
    this.id,
    this.name,
    this.schools,
    this.username,
  });
}

import 'package:br_ipti_tag_app/app/features/auth/domain/entities/user.dart';

class AuthResponse {
  String? accessToken;
  String? schoolYear;
  User? user;

  AuthResponse({
    this.accessToken,
    this.user,
    this.schoolYear,
  });
}

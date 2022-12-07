import 'user.dart';

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

import 'package:br_ipti_tag_app/app/features/login/data/models/auth_token_model.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/entities/auth_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthToken(AuthTokenModel token);
  Future<AuthToken> getAuthToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl();

  @override
  Future<void> cacheAuthToken(AuthTokenModel token) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString(
      "AUTH_TOKEN",
      token.toJson(),
    );
  }

  @override
  Future<AuthToken> getAuthToken() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final jsonToken = _sharedPreferences.get("AUTH_TOKEN") ?? {};
    return AuthTokenModel.fromJson(jsonToken as String);
  }
}

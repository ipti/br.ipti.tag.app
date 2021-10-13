import 'package:br_ipti_tag_app/app/features/auth/data/models/auth_token_model.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthToken(AuthTokenModel token);
  Future<AuthToken> getAuthToken();
  Future<bool> cleanCacheToken();
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
    final jsonToken = _sharedPreferences.getString("AUTH_TOKEN") ?? "";
    return AuthTokenModel.fromJson(jsonToken);
  }

  @override
  Future<bool> cleanCacheToken() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.remove("AUTH_TOKEN");
  }
}

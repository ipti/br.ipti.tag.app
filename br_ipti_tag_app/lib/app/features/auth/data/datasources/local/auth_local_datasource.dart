import 'package:br_ipti_tag_app/app/features/auth/data/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthToken(AuthModel token);
  Future<AuthModel> getAuthToken();
}

// TODO: Mudar métodos para apenas cache do AuthResponse
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl();

  @override
  Future<void> cacheAuthToken(AuthModel token) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString(
      "AUTH_TOKEN",
      token.toJson(),
    );
  }

  @override
  Future<AuthModel> getAuthToken() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final jsonToken = _sharedPreferences.getString("AUTH_TOKEN");
    if (jsonToken != null) return AuthModel.fromJson(jsonToken);

    throw Exception("Token não encontrado");
  }

  @override
  Future<bool> cleanCacheToken() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.remove("AUTH_TOKEN");
  }
}

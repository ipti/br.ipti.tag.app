import 'package:br_ipti_tag_app/app/api/auth/post_auth_login.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/login/data/models/auth_token_model.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/entities/auth_token.dart';

abstract class AuthRemoteDataSource {
  Future<AuthToken> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._httpClient);

  final RouterAPI _httpClient;

  @override
  Future<AuthToken> login(String email, String password) async {
    final response = await _httpClient.request(
      route: PostAuthLoginEndPoint(email, password),
    );

    if (response.data != null) {
      final result = AuthTokenModel.fromMap(response.data!);
      return result;
    }

    throw response.error ?? "Erro desconhecido";
  }
}

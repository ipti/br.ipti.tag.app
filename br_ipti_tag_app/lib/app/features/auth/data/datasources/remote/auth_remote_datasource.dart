import 'package:br_ipti_tag_app/app/core/api/auth/post_auth_login.dart';
import 'package:br_ipti_tag_app/app/core/api/users/get_users_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/models/auth_model.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/models/user_model.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._httpClient);

  final RouterAPI _httpClient;

  @override
  Future<AuthModel> login(String username, String password) async {
    final response = await _httpClient.request(
      route: PostAuthLoginEndPoint(username, password),
    );

    if (response.data != null) {
      final result = AuthModel.fromMap(response.data!);

      return result;
    }

    throw response.error ?? "Erro desconhecido";
  }

  Future<User> fetchUserData() async {
    final response = await _httpClient.request(
      route: GetUserEndPoint(),
    );

    if (response.data != null) {
      final result = UserModel.fromMap(response.data!);

      return result;
    }

    throw response.error ?? "Erro desconhecido";
  }
}

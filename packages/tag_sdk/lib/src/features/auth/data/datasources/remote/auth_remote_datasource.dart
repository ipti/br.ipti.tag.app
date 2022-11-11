import 'package:tag_sdk/src/core/api/auth/post_auth_login.dart';
import 'package:tag_sdk/src/core/api/users/get_users_endpoint.dart';
import 'package:tag_sdk/src/features/auth/data/models/auth_model.dart';
import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/auth/data/models/user_model.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';

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

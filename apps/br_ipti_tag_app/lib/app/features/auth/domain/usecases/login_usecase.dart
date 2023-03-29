import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class AuthLoginUsecase implements Usecase<AuthModel, LoginParams> {
  AuthLoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthModel>> call(LoginParams params) async {
    final result = await _repository.login(params.username, params.password);

    result.fold(
      id,
      (authToken) => _cacheSessionValues(authToken..schoolYear = params.year),
    );

    return result;
  }

  Future _cacheSessionValues(AuthModel response) async {
    final token = response.accessToken;
    final year = response.schoolYear;
    final schools = response.user?.schools;

    await Future.wait([
      _repository.storeAccessToken(token!),
      _repository.storeSchoolYear(year!),
      _repository.storeCurrentUserSchools(schools!),
    ]);
  }
}

class LoginParams {
  const LoginParams({
    required this.username,
    required this.password,
    required this.year,
  });

  final String username;
  final String password;
  final String year;
}

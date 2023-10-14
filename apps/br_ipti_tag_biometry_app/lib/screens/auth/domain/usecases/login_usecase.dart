import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../../core/plataform/session_service.dart';

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
    final service = Modular.get<SessionServiceImpl>();

    final token = response.accessToken;
    final year = response.schoolYear;
    final schools = response.user?.schools;

    service.setCurrentUser(response.user!);
    service.setCurrentUserSchools(response.user?.schools ?? []);
    service.setSchoolYear(year!);

    await Future.wait([
      _repository.storeAccessToken(token!),
      _repository.storeSchoolYear(year),
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

import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_response.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthLoginUsecase implements Usecase<AuthResponse, LoginParams> {
  AuthLoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, AuthResponse>> call(LoginParams params) async {
    final result = await _repository.login(params.username, params.password);

    result.fold(
      id,
      (authToken) => _cacheSessionValues(authToken..schoolYear = params.year),
    );

    return result;
  }

  Future _cacheSessionValues(AuthResponse response) async {
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

class LoginParams extends Equatable {
  const LoginParams({
    required this.username,
    required this.password,
    required this.year,
  });

  final String username;
  final String password;
  final String year;

  @override
  List<Object> get props => [];
}

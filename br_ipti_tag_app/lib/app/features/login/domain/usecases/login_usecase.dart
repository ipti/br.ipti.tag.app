import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/entities/auth_token.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthLoginUsecase implements Usecase<AuthToken, LoginParams> {
  AuthLoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, AuthToken>> call(LoginParams params) async {
    final result = await _repository.login(params.email, params.password);

    result.fold(
      id,
      (authToken) => _repository.cacheAuthToken(authToken),
    );

    return result;
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [];
}

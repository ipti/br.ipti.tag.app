import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
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
      (authToken) => _repository.cacheAuthToken(authToken),
    );

    return result;
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object> get props => [];
}

import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/models/auth_token_model.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_token.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRespositoryImpl extends AuthRepository {
  AuthRespositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  @override
  Future<Either<Exception, AuthToken>> login(
      String username, String password) async {
    try {
      final result = await authRemoteDataSource.login(username, password);
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, AuthToken>> getCachedAuthToken() async {
    try {
      final result = await authLocalDataSource.getAuthToken();
      return Right(result);
    } on Exception catch (e) {
      // TODO: implementar erro padrão para quando não existir valor em cache
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, void>> cacheAuthToken(AuthToken token) async {
    try {
      final result =
          await authLocalDataSource.cacheAuthToken(token as AuthTokenModel);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> logout() async {
    try {
      final response = await authLocalDataSource.cleanCacheToken();
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

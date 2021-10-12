import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/features/login/data/datasources/remote/auth_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/entities/auth_token.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRespositoryImpl extends AuthRepository {
  AuthRespositoryImpl({
    required this.authRemoteDataSource,
  });

  AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Exception, AuthToken>> login(
      String email, String password) async {
    try {
      final result = await authRemoteDataSource.login(email, password);
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }
}

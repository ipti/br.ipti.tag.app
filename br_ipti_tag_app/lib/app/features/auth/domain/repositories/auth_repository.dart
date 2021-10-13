import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_token.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, AuthToken>> login(String email, String password);
  Future<Either<Exception, AuthToken>> getCachedAuthToken();
  Future<Either<Exception, void>> cacheAuthToken(AuthToken token);
  Future<Either<Exception, void>> logout();
}

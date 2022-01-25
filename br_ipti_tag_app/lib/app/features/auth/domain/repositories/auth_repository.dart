import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, AuthResponse>> login(
      String username, String password);
  Future<Either<Exception, AuthResponse>> getCachedAuthToken();
  Future<Either<Exception, void>> cacheAuthToken(AuthResponse token);
  Future<Either<Exception, void>> logout();
}

import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_response.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, AuthResponse>> login(
    String username,
    String password,
  );

  Future<Either<Exception, String>> getAccessToken();
  Future<Either<Exception, bool>> storeAccessToken(String token);

  Future<Either<Exception, String>> getSchoolYear();
  Future<Either<Exception, bool>> storeSchoolYear(String year);

  Future<Either<Exception, List<School>>> getCurrentUserSchools();
  Future<Either<Exception, bool>> storeCurrentUserSchools(List<School> schools);

  Future<Either<Exception, void>> logout();
}

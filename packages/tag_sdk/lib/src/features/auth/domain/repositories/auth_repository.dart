import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/auth_response.dart';

import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

abstract class AuthRepository {
  Future<Either<Exception, AuthResponse>> login(
    String username,
    String password,
  );

  Future<Either<Exception, String>> getAccessToken();
  Future<Either<Exception, bool>> storeAccessToken(String token);

  Future<Either<Exception, User>> fetchUserData();

  Future<Either<Exception, String>> getSchoolYear();
  Future<Either<Exception, bool>> storeSchoolYear(String year);

  Future<Either<Exception, List<School>>> getCurrentUserSchools();
  Future<Either<Exception, bool>> storeCurrentUserSchools(List<School> schools);

  Future<Either<Exception, void>> logout();
}

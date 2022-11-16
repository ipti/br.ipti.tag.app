import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/auth_response.dart';

import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(
    String username,
    String password,
  );

  Future<Either<Failure, String>> getAccessToken();
  Future<Either<Failure, bool>> storeAccessToken(String token);

  Future<Either<Failure, User>> fetchUserData();

  Future<Either<Failure, String>> getSchoolYear();
  Future<Either<Failure, bool>> storeSchoolYear(String year);

  Future<Either<Failure, List<School>>> getCurrentUserSchools();
  Future<Either<Failure, bool>> storeCurrentUserSchools(List<School> schools);

  Future<Either<Failure, void>> logout();
}

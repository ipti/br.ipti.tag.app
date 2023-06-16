import 'package:dartz/dartz.dart';
import '../../../../../tag_sdk.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login(
    String username,
    String password,
  );

  Future<Either<Failure, String>> getAccessToken();

  Future<Either<Failure, bool>> storeAccessToken(String token);

  Future<Either<Failure, UserModel>> fetchUserData();

  Future<Either<Failure, String>> getSchoolYear();

  Future<Either<Failure, bool>> storeSchoolYear(String year);

  Future<Either<Failure, List<AuthSchool>>> getCurrentUserSchools();

  Future<Either<Failure, bool>> storeCurrentUserSchools(List<AuthSchool> schools);

  Future<Either<Failure, void>> logout();
}

import 'dart:developer';

import 'package:tag_sdk/src/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:tag_sdk/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/auth_response.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';
import 'package:tag_sdk/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

class AuthRespositoryImpl extends AuthRepository {
  AuthRespositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  @override
  Future<Either<Exception, AuthResponse>> login(
    String username,
    String password,
  ) async {
    try {
      final result = await authRemoteDataSource.login(username, password);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, String>> getAccessToken() async {
    try {
      final result = await authLocalDataSource.getToken();

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());

      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> storeAccessToken(String token) async {
    try {
      final result = await authLocalDataSource.setToken(token);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> logout() async {
    try {
      final response = await Future.wait([
        authLocalDataSource.cleanToken(),
        authLocalDataSource.cleanSchoolYear(),
        authLocalDataSource.cleanCurrentUserSchools(),
      ]);

      return Right(
        response.any((element) => element),
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<School>>> getCurrentUserSchools() async {
    try {
      final result = await authLocalDataSource.getCurrentUserSchools();

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());

      return Left(e);
    }
  }

  @override
  Future<Either<Exception, String>> getSchoolYear() async {
    try {
      final result = await authLocalDataSource.getSchoolYear();

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());

      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> storeCurrentUserSchools(
    List<School> schools,
  ) async {
    try {
      final result = await authLocalDataSource.setCurrentUserSchools(schools);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> storeSchoolYear(String year) async {
    try {
      final result = await authLocalDataSource.setSchoolYear(year);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, User>> fetchUserData() async {
    try {
      final result = await authLocalDataSource.getCurrentUser();

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

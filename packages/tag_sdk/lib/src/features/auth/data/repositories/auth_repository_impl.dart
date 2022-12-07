import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:tag_sdk/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/auth_response.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/auth_school.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';
import 'package:tag_sdk/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRespositoryImpl extends AuthRepository {
  AuthRespositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  @override
  Future<Either<Failure, AuthResponse>> login(
    String username,
    String password,
  ) async {
    try {
      final result = await authRemoteDataSource.login(username, password);
      return Right(result);
    } on RestClientException catch (e) {
      return Left(RestFailure(e.message));
    } catch (e) {
      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, String>> getAccessToken() async {
    try {
      final result = await authLocalDataSource.getToken();

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());
      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, bool>> storeAccessToken(String token) async {
    try {
      final result = await authLocalDataSource.setToken(token);

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());

      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
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
      log(e.toString());
      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, List<AuthSchool>>> getCurrentUserSchools() async {
    try {
      final result = await authLocalDataSource.getCurrentUserSchools();

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());

      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, String>> getSchoolYear() async {
    try {
      final result = await authLocalDataSource.getSchoolYear();

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());

      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, bool>> storeCurrentUserSchools(
    List<AuthSchool> schools,
  ) async {
    try {
      final result = await authLocalDataSource.setCurrentUserSchools(schools);

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());
      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, bool>> storeSchoolYear(String year) async {
    try {
      final result = await authLocalDataSource.setSchoolYear(year);

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());
      return Left(Failure("Erro desconhecido"));
    }
  }

  @override
  Future<Either<Failure, User>> fetchUserData() async {
    try {
      final result = await authLocalDataSource.getCurrentUser();

      return Right(result);
    } on Exception catch (e) {
      log(e.toString());
      return Left(Failure("Erro desconhecido"));
    }
  }
}

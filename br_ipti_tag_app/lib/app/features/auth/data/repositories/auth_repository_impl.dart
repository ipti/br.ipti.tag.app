import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';

import 'package:br_ipti_tag_app/app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_response.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRespositoryImpl extends AuthRepository {
  AuthRespositoryImpl({
    required this.authRemoteDataSource,
    required this.sessionService,
  });

  AuthRemoteDataSource authRemoteDataSource;
  SessionService sessionService;

  @override
  Future<Either<Exception, AuthResponse>> login(
    String username,
    String password,
  ) async {
    try {
      final result = await authRemoteDataSource.login(username, password);
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, String>> getAccessToken() async {
    try {
      final result = await sessionService.getToken();
      return Right(result);
    } on Exception catch (e) {
      // TODO: implementar erro padrão para quando não existir valor em store
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> storeAccessToken(String token) async {
    try {
      final result = await sessionService.setToken(token);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> logout() async {
    try {
      final response = await Future.wait([
        sessionService.cleanToken(),
        sessionService.cleanSchoolYear(),
        sessionService.cleanCurrentUserSchools(),
      ]);
      return Right(response.any((element) => element));
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<School>>> getCurrentUserSchools() async {
    try {
      final result = await sessionService.getCurrentUserSchools();
      return Right(result);
    } on Exception catch (e) {
      // TODO: implementar erro padrão para quando não existir valor em store
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, String>> getSchoolYear() async {
    try {
      final result = await sessionService.getSchoolYear();
      return Right(result);
    } on Exception catch (e) {
      // TODO: implementar erro padrão para quando não existir valor em store
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> storeCurrentUserSchools(
    List<School> schools,
  ) async {
    try {
      final result = await sessionService.setCurrentUserSchools(schools);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> storeSchoolYear(String year) async {
    try {
      final result = await sessionService.setSchoolYear(year);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

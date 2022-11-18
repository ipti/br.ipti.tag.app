import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/data/datasources/remote/student_enrollment_remote_datasource.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_enrollment_repositories.dart';

class StudentEnrollmentRepositoryImpl implements StudentEnrollmentRepository {
  StudentEnrollmentRepositoryImpl(
    this._enrollmenrRemoteDataSource,
  );

  final StudentEnrollmenrRemoteDataSource _enrollmenrRemoteDataSource;

  @override
  Future<Either<Failure, StudentEnrollment>> getById(int id) async {
    try {
      final result = await _enrollmenrRemoteDataSource.getById(id);

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Failure, StudentEnrollment>> getStudentById(
    int studentId,
  ) async {
    try {
      final result = await _enrollmenrRemoteDataSource.getByStudentId(
        studentId,
      );

      return Right(result);
    } catch (e) {
      log(
        e.toString(),
      );

      return Left(
        Failure("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Failure, StudentEnrollment>> create(
    StudentEnrollment Classroom,
  ) async {
    try {
      final result = await _enrollmenrRemoteDataSource.create(
        Classroom,
      );

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível adicionar estudante"),
      );
    }
  }

  @override
  Future<Either<Failure, StudentEnrollment>> update(
    int id,
    StudentEnrollment Classroom,
  ) async {
    try {
      final result = await _enrollmenrRemoteDataSource.update(
        id,
        Classroom,
      );

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível alterar estudante"),
      );
    }
  }
}

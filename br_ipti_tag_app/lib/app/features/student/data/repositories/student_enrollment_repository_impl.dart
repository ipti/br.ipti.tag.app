import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_enrollment_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_enrollment_model.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class StudentEnrollmentRepositoryImpl implements StudentEnrollmentRepository {
  StudentEnrollmentRepositoryImpl(
    this._enrollmenrRemoteDataSource,
  );

  final StudentEnrollmenrRemoteDataSource _enrollmenrRemoteDataSource;

  @override
  Future<Either<Exception, StudentEnrollment>> getById(int id) async {
    try {
      final result = await _enrollmenrRemoteDataSource.getById(id);
      return Right(result);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, StudentEnrollment>> getStudentById(
    int studentId,
  ) async {
    try {
      final result = await _enrollmenrRemoteDataSource.getByStudentId(
        studentId,
      );
      return Right(result);
    } catch (e) {
      debugPrint(e.toString());
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, StudentEnrollment>> create(
      StudentEnrollment studentEnrollment) async {
    try {
      final result = await _enrollmenrRemoteDataSource.create(
        StudentEnrollmentModel.fromEntity(studentEnrollment),
      );

      return Right(result);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudante"));
    }
  }

  @override
  Future<Either<Exception, StudentEnrollment>> update(
      String id, StudentEnrollment studentEnrollment) async {
    try {
      final result = await _enrollmenrRemoteDataSource.update(
        id,
        StudentEnrollmentModel.fromEntity(studentEnrollment),
      );

      return Right(result);
    } catch (e) {
      return Left(Exception("Não foi possível alterar estudante"));
    }
  }
}

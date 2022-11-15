import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/student/data/datasources/remote/student_remote_datasource.dart';
import 'package:tag_sdk/src/features/student/data/models/student_model.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';

class StudentRepositoryImpl implements StudentRepository {
  StudentRepositoryImpl(
    this._studentDataSource,
  );

  final StudentRemoteDataSource _studentDataSource;

  @override
  Future<Either<Exception, List<Student>>> listAll({
    required String schoolId,
  }) async {
    try {
      final results = await _studentDataSource.listAll(schoolId: schoolId);

      return Right(results);
    } catch (e) {
      log(
        e.toString(),
      );

      return Left(
        Exception("Não foi possível listar estudantes, tente novamente"),
      );
    }
  }

  @override
  Future<Either<Exception, Student>> getById(
    String id, {
    required String schoolId,
  }) async {
    try {
      final result = await _studentDataSource.getById(id, schoolId: schoolId);

      return Right(result);
    } catch (e) {
      return Left(
        Exception("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Exception, Student>> create(Student student) async {
    try {
      final model = StudentModel.fromEntity(student);
      final result = await _studentDataSource.create(model);

      return Right(result);
    } catch (e) {
      return Left(
        Exception("Não foi possível adicionar estudante"),
      );
    }
  }

  @override
  Future<Either<Exception, Student>> update(int id, Student student) async {
    try {
      final model = StudentModel.fromEntity(student);
      final result = await _studentDataSource.update(id, model);

      return Right(result);
    } catch (e) {
      return Left(
        Exception("Não foi possível alterar estudante"),
      );
    }
  }

  @override
  Future<Either<Exception, bool>> delete(String id) async {
    try {
      final result = await _studentDataSource.delete(id);

      return Right(result);
    } catch (e) {
      return Left(
        Exception("Não foi possível deletar estudante"),
      );
    }
  }
}

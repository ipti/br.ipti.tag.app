import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';

import 'package:tag_sdk/src/features/teacher/data/datasources/remote/teacher_remote_datasource.dart';

import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';
import 'package:tag_sdk/src/features/teacher/domain/repositories/instructor_repository.dart';

class InstructorRepositoryImpl implements InstructorRepository {
  InstructorRepositoryImpl(this._instructorDataSource);

  final TeacherRemoteDataSource _instructorDataSource;

  @override
  Future<Either<Failure, List<Instructor>>> listAll() async {
    try {
      final results = await _instructorDataSource.listAll();

      final mappedResults = results.toList();

      return Right(mappedResults);
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
  Future<Either<Failure, Instructor>> getById(int id) async {
    try {
      final result = await _instructorDataSource.getById(id);

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Failure, Instructor>> create(Instructor instructor) async {
    try {
      final results = await _instructorDataSource.create(instructor);

      return Right(results);
    } catch (e) {
      log(
        e.toString(),
      );

      return Left(
        Failure("Não foi possível adicionar professor"),
      );
    }
  }

  @override
  Future<Either<Failure, Instructor>> update(
    int id,
    Instructor instructor,
  ) async {
    try {
      final results = await _instructorDataSource.update(id, instructor);

      return Right(results);
    } catch (e) {
      log(
        e.toString(),
      );

      return Left(
        Failure("Não foi possível atualizar dados do professor"),
      );
    }
  }
}
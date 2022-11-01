import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:tag_sdk/src/features/teacher/data/datasources/remote/teacher_remote_datasource.dart';
import 'package:tag_sdk/src/features/teacher/data/models/instructor_model.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';
import 'package:tag_sdk/src/features/teacher/domain/repositories/instructor_repository.dart';

class InstructorRepositoryImpl implements InstructorRepository {
  InstructorRepositoryImpl(this._instructorDataSource);

  final TeacherRemoteDataSource _instructorDataSource;

  @override
  Future<Either<Exception, List<Instructor>>> listAll() async {
    try {
      final results = await _instructorDataSource.listAll();

      final mappedResults = results.toList();

      return Right(mappedResults);
    } catch (e) {
      log(
        e.toString(),
      );

      return Left(
        Exception("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Exception, Instructor>> getById(String id) async {
    try {
      final result = await _instructorDataSource.getById(id);

      return Right(result);
    } catch (e) {
      return Left(
        Exception("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Exception, Instructor>> create(Instructor instructor) async {
    try {
      final instructorModel = InstructorModel.fromEntity(instructor);
      final results = await _instructorDataSource.create(instructorModel);

      return Right(results);
    } catch (e) {
      log(
        e.toString(),
      );

      return Left(
        Exception("Não foi possível adicionar professor"),
      );
    }
  }

  @override
  Future<Either<Exception, Instructor>> update(
    String id,
    Instructor instructor,
  ) async {
    try {
      final instructorModel = InstructorModel.fromEntity(instructor);
      final results = await _instructorDataSource.update(id, instructorModel);

      return Right(results);
    } catch (e) {
      log(
        e.toString(),
      );

      return Left(
        Exception("Não foi possível atualizar dados do professor"),
      );
    }
  }
}

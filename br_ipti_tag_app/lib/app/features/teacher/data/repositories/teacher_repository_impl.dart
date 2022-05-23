import 'package:br_ipti_tag_app/app/features/teacher/data/datasources/remote/teacher_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/teacher/data/models/instructor_model.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/instructor_repository.dart';

import 'package:dartz/dartz.dart';

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
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, Instructor>> getById(int id) async {
    try {
      final result = await _instructorDataSource.getById(id);

      return Right(result);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, bool>> create(Instructor instructor) async {
    try {
      final instructorModel = InstructorModel.fromEntity(instructor);
      final results = await _instructorDataSource.create(instructorModel);
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }
}

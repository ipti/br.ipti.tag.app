import 'package:br_ipti_tag_app/app/features/student/data/datasources/student_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/student.dart';

class StudentRepositoryImpl implements StudentRepository {
  StudentRepositoryImpl(this._studentDataSource);

  final StudentDataSource _studentDataSource;

  @override
  Future<Either<Exception, List<Student>>> listAll() async {
    try {
      final results = await _studentDataSource.listAll();
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, Student>> getById(int id) async {
    try {
      final results = await _studentDataSource.getById(id);
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, bool>> create(Student student) async {
    try {
      final results = await _studentDataSource.create(student);
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }
}

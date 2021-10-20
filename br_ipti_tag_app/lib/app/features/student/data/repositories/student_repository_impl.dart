import 'package:br_ipti_tag_app/app/features/student/data/datasources/student_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/mappers/student_api_to_entity.dart';
import 'package:dartz/dartz.dart';

class StudentRepositoryImpl implements StudentRepository {
  StudentRepositoryImpl(this._studentDataSource, this._apiToEntity);

  final StudentRemoteDataSource _studentDataSource;
  final StudentApiToEntityMapper _apiToEntity;

  @override
  Future<Either<Exception, List<Student>>> listAll() async {
    try {
      final results = await _studentDataSource.listAll();

      final mappedResults = results.map((e) => _apiToEntity(e)).toList();

      return Right(mappedResults);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, Student>> getById(int id) async {
    try {
      final result = await _studentDataSource.getById(id);
      final mappedResult = _apiToEntity(result);
      return Right(mappedResult);
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

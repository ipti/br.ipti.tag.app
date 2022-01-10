import 'package:br_ipti_tag_app/app/features/student/data/datasources/student_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_model.dart';
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
  Future<Either<Exception, Student>> create(Student student) async {
    try {
      final model = StudentModel.fromEntity(student);
      final result = await _studentDataSource.create(model);
      final mappedResult = _apiToEntity(result);
      return Right(mappedResult);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }

  @override
  Future<Either<Exception, Student>> update(String id, Student student) async {
    try {
      final model = StudentModel.fromEntity(student);
      final result = await _studentDataSource.update(id, model);
      final mappedResult = _apiToEntity(result);
      return Right(mappedResult);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }
}

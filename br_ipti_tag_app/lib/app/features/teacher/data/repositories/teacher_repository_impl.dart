import 'package:br_ipti_tag_app/app/features/teacher/data/datasources/remote/teacher_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/teacher_repository.dart';
import 'package:br_ipti_tag_app/app/features/teacher/mappers/teacher_api_to_entity.dart';
import 'package:dartz/dartz.dart';

class TeacherRepositoryImpl implements TeacherRepository {
  TeacherRepositoryImpl(this._teacherDataSource, this._apiToEntity);

  final TeacherRemoteDataSource _teacherDataSource;
  final TeacherApiToEntityMapper _apiToEntity;

  @override
  Future<Either<Exception, List<Teacher>>> listAll() async {
    try {
      final results = await _teacherDataSource.listAll();

      final mappedResults = results.map((e) => _apiToEntity(e)).toList();

      return Right(mappedResults);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, Teacher>> getById(int id) async {
    try {
      final result = await _teacherDataSource.getById(id);
      final mappedResult = _apiToEntity(result);
      return Right(mappedResult);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, bool>> create(Teacher teacher) async {
    try {
      final results = await _teacherDataSource.create(teacher);
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }
}

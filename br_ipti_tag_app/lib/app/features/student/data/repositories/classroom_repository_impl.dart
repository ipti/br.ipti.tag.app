import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/classroom_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/classroom_repositories.dart';

import 'package:dartz/dartz.dart';

class ClassroomRepositoryImpl implements ClassroomRepository {
  ClassroomRepositoryImpl(this._classroomDataSource);

  final    _classroomDataSource;

  @override
  Future<Either<Exception, List<Classroom>>> listAll(
    ClassroomParams params,
  ) async {
    try {
      final results = await _classroomDataSource.listAll(params);

      final mappedResults = results.cast<Classroom>();

      return Right(mappedResults);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }
}

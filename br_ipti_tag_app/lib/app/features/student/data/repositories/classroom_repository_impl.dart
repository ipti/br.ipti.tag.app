import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/classroom_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/classroom_repositories.dart';

import 'package:dartz/dartz.dart';

class ClassroomRepositoryImpl implements ClassroomRepository {
  ClassroomRepositoryImpl(this._classroomDataSource);

  final ClassroomRemoteDataSource _classroomDataSource;

  @override
  Future<Either<Exception, List<Classroom>>> listAll(
      {required String schoolId}) async {
    try {
      final results = await _classroomDataSource.listAll(schoolId: schoolId);

      final mappedResults = results.cast<Classroom>();

      return Right(mappedResults);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }
}

import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ClassroomRepositoryImpl extends ClassroomRepository {
  final ClassroomRemoteDataSource classroomRemoteDataSource;

  ClassroomRepositoryImpl({required this.classroomRemoteDataSource});

  @override
  Future<Either<Exception, bool>> create(
    ClassroomCreateEntity classroom,
  ) async {
    try {
      final result = await classroomRemoteDataSource.create(
        classroom.fromEntity(),
      );
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<Classroom>>> list() async {
    return Right(<Classroom>[
      Classroom(
          name: "1º ano Ensino Fundamental",
          endTime: null,
          startTime: null,
          modalityId: 0,
          stageId: 0,
          typePedagogicMediationId: 0),
      Classroom(
          name: "3º ano Ensino Fundamental",
          endTime: null,
          startTime: null,
          modalityId: 0,
          stageId: 0,
          typePedagogicMediationId: 0),
      Classroom(
          name: "4º ano Ensino Fundamental",
          endTime: null,
          startTime: null,
          modalityId: 0,
          stageId: 0,
          typePedagogicMediationId: 0),
    ]);
  }
}

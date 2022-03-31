import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ClassroomRepository {
  Future<Either<Exception, bool>> create(ClassroomCreateEntity classroom);
  Future<Either<Exception, List<ClassroomEntity>>> list();
  Future<Either<Exception, bool>> update({
    required String id,
    required ClassroomCreateEntity classroomCreateEntity,
  });
  Future<Either<Exception, bool>> delete({
    required String id,
  });
}

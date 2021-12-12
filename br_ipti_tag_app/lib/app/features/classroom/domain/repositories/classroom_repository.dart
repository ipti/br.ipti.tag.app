import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create.dart';
import 'package:dartz/dartz.dart';

abstract class ClassroomRepository {
  Future<Either<Exception, bool>> create(ClassroomCreate classroom);
  Future<Either<Exception, List<Classroom>>> list();
}

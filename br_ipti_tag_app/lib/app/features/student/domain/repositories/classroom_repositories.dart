import 'package:br_ipti_tag_app/app/features/student/domain/entities/classroom.dart';
import 'package:dartz/dartz.dart';

abstract class ClassroomRepository {
  Future<Either<Exception, List<Classroom>>> listAll(
      {required String schoolId});
}

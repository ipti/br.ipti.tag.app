import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';
import 'package:dartz/dartz.dart';

abstract class TeacherRepository {
  Future<Either<Exception, List<Teacher>>> listAll();
  Future<Either<Exception, Teacher>> getById(int id);
  Future<Either<Exception, bool>> create(Teacher student);
}

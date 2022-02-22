import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:dartz/dartz.dart';

abstract class StudentEnrollmentRepository {
  Future<Either<Exception, StudentEnrollment>> getById(int id);
  Future<Either<Exception, StudentEnrollment>> create(
      StudentEnrollment studentdosStudentEnrollment);
  Future<Either<Exception, StudentEnrollment>> update(
      String id, StudentEnrollment student);
}

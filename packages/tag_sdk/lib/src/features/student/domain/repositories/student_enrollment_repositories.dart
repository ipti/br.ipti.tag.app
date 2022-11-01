import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';

abstract class StudentEnrollmentRepository {
  Future<Either<Exception, StudentEnrollment>> getById(int id);
  Future<Either<Exception, StudentEnrollment>> getStudentById(int id);
  Future<Either<Exception, StudentEnrollment>> create(
    StudentEnrollment studentdosStudentEnrollment,
  );
  Future<Either<Exception, StudentEnrollment>> update(
    String id,
    StudentEnrollment student,
  );
}

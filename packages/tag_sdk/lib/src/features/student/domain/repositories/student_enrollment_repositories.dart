import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';

abstract class StudentEnrollmentRepository {
  Future<Either<Failure, StudentEnrollment>> getById(int id);
  Future<Either<Failure, StudentEnrollment>> getStudentById(int id);
  Future<Either<Failure, StudentEnrollment>> create(
    StudentEnrollment studentdosStudentEnrollment,
  );
  Future<Either<Failure, StudentEnrollment>> update(
    int id,
    StudentEnrollment student,
  );
}

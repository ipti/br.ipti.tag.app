import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';

abstract class StudentDocumentsAddressRepository {
  Future<Either<Failure, StudentDocsAddress>> getByStudentId(
    int id,
  );
  Future<Either<Failure, StudentDocsAddress>> create(
    StudentDocsAddress studentdosStudentDocuments,
  );
  Future<Either<Failure, StudentDocsAddress>> update(
    int id,
    StudentDocsAddress student,
  );
}

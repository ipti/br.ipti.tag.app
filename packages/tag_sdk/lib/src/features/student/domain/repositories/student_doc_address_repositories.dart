import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';

abstract class StudentDocumentsAddressRepository {
  Future<Either<Failure, StudentDocsAndAddress>> getByStudentId(
    int id,
  );
  Future<Either<Failure, StudentDocsAndAddress>> create(
    StudentDocsAndAddress studentdosStudentDocuments,
  );
  Future<Either<Failure, StudentDocsAndAddress>> update(
    int id,
    StudentDocsAndAddress student,
  );
}

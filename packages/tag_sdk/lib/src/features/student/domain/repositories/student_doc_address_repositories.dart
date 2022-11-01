import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';

abstract class StudentDocumentsAddressRepository {
  Future<Either<Exception, StudentDocsAddress>> getByStudentId(
    int id,
  );
  Future<Either<Exception, StudentDocsAddress>> create(
    StudentDocsAddress studentdosStudentDocuments,
  );
  Future<Either<Exception, StudentDocsAddress>> update(
    String id,
    StudentDocsAddress student,
  );
}
